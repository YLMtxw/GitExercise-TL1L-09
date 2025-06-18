extends CharacterBody2D

signal npc_left(seat: Node2D)
signal started_moving_to_seat
signal at_counter
signal left_counter
signal order_accepted(dish_name)
signal left_counter_unserved

@export var speed := 100

@onready var agent = $NavigationAgent2D
@onready var leave_timer = $LeaveTimer
@onready var counter_wait_timer = $CounterWaitTimer
@onready var animated_sprite = $AnimatedSprite2D
@onready var speech_label = $SpeechLabel

var order_data: Dictionary
var target_seat: Node2D = null
var counter_position: Vector2 = Vector2.ZERO
var exit_position: Vector2 = Vector2.ZERO # Set by spawner!
var seated: bool = false
var waiting_at_counter: bool = true
var has_shown_text: bool = false
var at_counter_flag := false
var exiting: bool = false
var last_move_dir := Vector2.DOWN  # Default direction

func _ready():
	leave_timer.timeout.connect(_on_leave_timer_timeout)
	counter_wait_timer.timeout.connect(_on_counter_wait_timer_timeout)
	if counter_position != Vector2.ZERO:
		agent.target_position = counter_position
		_play_walk_animation()
		OrderManager.set_current_order(self, order_data)

func move_to_seat():
	if target_seat:
		waiting_at_counter = false
		at_counter_flag = false
		counter_wait_timer.stop()
		emit_signal("left_counter")
		agent.target_position = target_seat.global_position
		emit_signal("started_moving_to_seat")
		_play_walk_animation()
		_hide_speech()

func move_to_exit():
	exiting = true
	waiting_at_counter = false
	seated = false
	_hide_speech()
	agent.target_position = exit_position
	_play_walk_animation()

func _physics_process(_delta):
	if exiting:
		if not agent.is_navigation_finished():
			var next = agent.get_next_path_position()
			velocity = (next - global_position).normalized() * speed
			move_and_slide()
			_play_walk_animation()
		else:
			velocity = Vector2.ZERO
			move_and_slide()
			_play_idle_animation()
			emit_signal("npc_left", target_seat)
			queue_free()
		return

	if seated or target_seat == null:
		return

	if not agent.is_navigation_finished():
		var next = agent.get_next_path_position()
		velocity = (next - global_position).normalized() * speed
		move_and_slide()
		_play_walk_animation()
	else:
		velocity = Vector2.ZERO
		move_and_slide()
		_play_idle_animation()

		# ✅ Show order text once at counter
		if waiting_at_counter and not has_shown_text:
			_show_speech(OrderManager.format_order_text(order_data))

	# ✅ Seat detection
	if not waiting_at_counter and not exiting and global_position.distance_to(target_seat.global_position) < agent.target_desired_distance:
		target_seat._on_OccupyArea_body_entered(self)
		seated = true
		velocity = Vector2.ZERO
		move_and_slide()
		# Force idle direction at seat1/seat2
		var dir = get_idle_direction_for_seat(target_seat)
		if dir == "up":
			last_move_dir = Vector2.UP
		elif dir == "down":
			last_move_dir = Vector2.DOWN
		_play_idle_animation()
		leave_timer.start()

	if waiting_at_counter and not at_counter_flag:
		at_counter_flag = true
		emit_signal("at_counter")
		counter_wait_timer.start()	# Start wait timer at counter

func _on_leave_timer_timeout():
	if target_seat:
		target_seat.occupied = false
	move_to_exit()

func _on_counter_wait_timer_timeout():
	if waiting_at_counter:
		print("⏰ NPC was not served in time and leaves disappointed!")
		emit_signal("left_counter_unserved", target_seat)
		move_to_exit()

func _on_counter_timer_timeout():
	emit_signal("left_counter_unserved", target_seat)
	move_to_exit()

func get_idle_direction_for_seat(seat: Node2D) -> String:
	if seat == null:
		return "down"
	var seat_name = seat.name.to_lower()
	if seat_name.contains("1"):
		return "up"
	elif seat_name.contains("2"):
		return "down"
	else:
		return "down"  # default

func _play_walk_animation():
	var dir = velocity.normalized()
	if dir.length() < 0.1:
		dir = last_move_dir
	else:
		last_move_dir = dir

	# Prefer left/right if stronger in x, else up/down
	if abs(dir.x) > abs(dir.y):
		if dir.x > 0:
			animated_sprite.play("walk_right")
		else:
			animated_sprite.play("walk_left")
	else:
		if dir.y > 0:
			animated_sprite.play("walk_down")
		else:
			animated_sprite.play("walk_up")

func _play_idle_animation():
	if last_move_dir.y < 0:
		animated_sprite.play("idle_up")
	else:
		animated_sprite.play("idle_down")

# ==== Speech Bubble ====
func _show_speech(text: String):
	speech_label.text = text
	speech_label.visible = true
	has_shown_text = true

func _hide_speech():
	speech_label.visible = false

func is_near_counter() -> bool:
	return position.distance_to(counter_position) < 32

func receive_served_item(served_dish_name: String):
	if not RecipeDatabase.recipes.has(served_dish_name):
		print("❌ This food is not recognized.")
		return

	var served_ingredients = RecipeDatabase.recipes[served_dish_name].duplicate()
	served_ingredients.sort()
	var expected_ingredients = order_data.get("ingredients", []).duplicate()
	expected_ingredients.sort()

	if served_ingredients == expected_ingredients:
		print("✅ Correct dish served! Thank you!")
		_hide_speech()
		counter_wait_timer.stop()
		# ERASE THE MODIFIED RECIPE IF IT'S NOT THE BASE RECIPE
		if order_data.has("base_name") and order_data["name"] != order_data["base_name"]:
			if RecipeDatabase.recipes.has(order_data["name"]):
				RecipeDatabase.recipes.erase(order_data["name"])
				print("Temporary recipe erased:", order_data["name"])
		move_to_seat()
	else:
		print("❌ Wrong order! I wanted:", expected_ingredients, "but got:", served_ingredients)
		_show_speech("That's not what I ordered!")
		counter_wait_timer.stop()
		emit_signal("left_counter_unserved", target_seat)
		move_to_exit()
