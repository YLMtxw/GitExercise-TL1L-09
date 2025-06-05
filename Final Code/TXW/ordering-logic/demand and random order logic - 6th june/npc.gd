extends Node2D

var speed = 100
var accel = 7

@onready var navigation_agent_2d: NavigationAgent2D = $body/NavigationAgent2D


func _physics_process(delta):
	var direction = Vector3()
	
	navigation_agent_2d.target_position = get_global_mouse_position()
	
	direction = navigation_agent_2d.get_next_path_position() - global_position
	direction = direction.normalized()
	
