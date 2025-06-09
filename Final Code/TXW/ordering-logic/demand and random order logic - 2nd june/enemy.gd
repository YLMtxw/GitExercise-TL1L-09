extends CharacterBody2D


var SPEED = 300.0
var accel = 7

@onready var navigation_agent_2d: NavigationAgent2D = $NavigationAgent2D

func _physics_process(delta):
	var direction = Vector3()
	
	navigation_agent_2d.target_position = get_global_mouse_position()
	
	direction = navigation_agent_2d.get_next_path_position() - global_position
	direction = direction.normalized()
	
	velocity = velocity.lerp(direction * SPEED , accel * delta)

	move_and_slide()
