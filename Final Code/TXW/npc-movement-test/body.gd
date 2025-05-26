extends CharacterBody2D

signal npc_left(seat: Node2D)

@export var speed := 100
@onready var agent = $NavigationAgent2D
@onready var leave_timer = $LeaveTimer

var target_seat: Node2D = null
var seated: bool = false

func _ready():
	leave_timer.timeout.connect(_on_leave_timer_timeout)
	move_to_seat()

func move_to_seat():
	if target_seat:
		agent.target_position = target_seat.global_position

func _physics_process(_delta):
	if seated or target_seat == null:
		return

	if target_seat.occupied:
		return

	if not agent.is_navigation_finished():
		var next = agent.get_next_path_position()
		velocity = (next - global_position).normalized() * speed
		move_and_slide()

	if global_position.distance_to(target_seat.global_position) < agent.target_desired_distance:
		target_seat._on_OccupyArea_body_entered(self)
		seated = true
		velocity = Vector2.ZERO
		move_and_slide()
		leave_timer.start()

func _on_leave_timer_timeout():
	if target_seat:
		target_seat.occupied = false
	emit_signal("npc_left", target_seat)
	queue_free()
