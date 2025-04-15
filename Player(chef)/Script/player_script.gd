class_name player_character extends CharacterBody2D

const  movement_speed : int = 150
const run_speed : int = 300
#vector2 contain 2 num, x and y
var direction : Vector2 = Vector2.ZERO

	
func _process( delta ):
	
	direction.x = Input.get_action_strength("Right") - Input.get_action_strength("Left")
	direction.y = Input.get_action_strength("Down") - Input.get_action_strength("Up")

func _physics_process( delta ):
	var current_speed = movement_speed
	if Input.is_key_pressed(KEY_SHIFT): 
		current_speed = run_speed
	velocity = direction * current_speed
	move_and_slide()
