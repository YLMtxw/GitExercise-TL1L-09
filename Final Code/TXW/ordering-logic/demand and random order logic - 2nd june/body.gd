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

func _ready():
	leave_timer.timeout.connect(_on_leave_timer_timeout)

	var order_data = OrderManager.generate_order()
	_show_speech("Order: " + order_data["name"])

	# Move to the counter first
	if counter_position != Vector2.ZERO:
		agent.target_position = counter_position
		_play_walk_animation()

func move_to_seat():
	if target_seat:
		waiting_at_counter = false
		agent.target_position = target_seat.global_position
		emit_signal("started_moving_to_seat")
		_play_walk_animation()
		_hide_speech()  # Hide text when starting to move to seat

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

		# Show speech only once after reaching the counter
		if waiting_at_counter and not has_shown_text:
			_show_speech("I'd like to order!")

	# Seat detection
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
