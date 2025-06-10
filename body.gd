extends CharacterBody2D

signal npc_left(seat: Node2D)
signal started_moving_to_seat

@export var speed := 100

@onready var agent = $NavigationAgent2D
@onready var leave_timer = $LeaveTimer
@onready var animated_sprite = $AnimatedSprite2D
@onready var speech_label = $SpeechLabel

var order_data: Dictionary
var target_seat: Node2D = null
var counter_position: Vector2 = Vector2.ZERO
var seated: bool = false
var waiting_at_counter: bool = true
var has_shown_text: bool = false
var order_recipe_name : String = ""

func _ready():
	leave_timer.timeout.connect(_on_leave_timer_timeout)

	if counter_position != Vector2.ZERO:
		agent.target_position = counter_position
		_play_walk_animation()
		
		OrderManager.set_current_order(self, order_data)
		
func move_to_seat():
	if target_seat:
		waiting_at_counter = false
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
			var food_name = order_data.get("name", "???")
			var mods = order_data.get("modifications", [])

			var full_text = "I'd like a " + food_name
			if mods.size() > 0:
				full_text += " (" + ", ".join(mods) + ")"

			_show_speech(full_text)

	# ✅ Seat detection
	if not waiting_at_counter and global_position.distance_to(target_seat.global_position) < agent.target_desired_distance:
		target_seat._on_OccupyArea_body_entered(self)
		seated = true
		velocity = Vector2.ZERO
		move_and_slide()
		_play_idle_animation()
		leave_timer.start()

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
	return global_position.distance_to(counter_position) < agent.target_desired_distance

# ================================
# ✅ NEW: Static method to check NPC proximity to counter
# ================================
static func get_npc_at_counter(all_npcs: Array, counter_pos: Vector2, threshold: float = 32.0) -> Node:
	for npc in all_npcs:
		if npc.waiting_at_counter and npc.global_position.distance_to(counter_pos) <= threshold:
			return npc
	return null
