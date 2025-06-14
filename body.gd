extends CharacterBody2D

signal npc_left(seat: Node2D)
signal started_moving_to_seat
signal at_counter
signal left_counter
signal order_accepted(dish_name)

@export var speed := 100

@onready var agent = $NavigationAgent2D
@onready var leave_timer = $LeaveTimer
@onready var animated_sprite = $AnimatedSprite2D
@onready var speech_label = $SpeechLabel

var order_data: Dictionary # Set by spawner!
var target_seat: Node2D = null
var counter_position: Vector2 = Vector2.ZERO
var seated: bool = false
var waiting_at_counter: bool = true
var has_shown_text: bool = false
var at_counter_flag := false

func _ready():
	leave_timer.timeout.connect(_on_leave_timer_timeout)
	if counter_position != Vector2.ZERO:
		agent.target_position = counter_position
		_play_walk_animation()
		# Always set current order in OrderManager for reference/debug (optional)
		OrderManager.set_current_order(self, order_data)

func move_to_seat():
	if target_seat:
		waiting_at_counter = false
		at_counter_flag = false
		emit_signal("left_counter")
		agent.target_position = target_seat.global_position
		emit_signal("started_moving_to_seat")
		_play_walk_animation()
		_hide_speech()

func _physics_process(_delta):
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
	if not waiting_at_counter and global_position.distance_to(target_seat.global_position) < agent.target_desired_distance:
		target_seat._on_OccupyArea_body_entered(self)
		seated = true
		velocity = Vector2.ZERO
		move_and_slide()
		_play_idle_animation()
		leave_timer.start()

	if waiting_at_counter and not at_counter_flag:
		# NPC has just arrived at counter
		at_counter_flag = true
		emit_signal("at_counter")

func _on_leave_timer_timeout():
	if target_seat:
		target_seat.occupied = false
	emit_signal("npc_left", target_seat)
	queue_free()

func _play_walk_animation():
	if not animated_sprite.is_playing() or animated_sprite.animation != "walk":
		animated_sprite.play("walk")

func _play_idle_animation():
	if not animated_sprite.is_playing() or animated_sprite.animation != "idle":
		animated_sprite.play("idle")

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
		emit_signal("order_accepted", served_dish_name) # <- Add this
		move_to_seat()
	else:
		print("❌ Wrong order! I wanted:", expected_ingredients, "but got:", served_ingredients)
		_show_speech("That's not what I ordered!")
