class_name player_character extends CharacterBody2D

const  movement_speed : int = 150
const run_speed : int = 225
#vector2 contain 2 num, x and y
var direction : Vector2 = Vector2.ZERO
@onready var animation = $AnimationPlayer

func _process( delta ):
	
	direction.x = Input.get_action_strength("Right") - Input.get_action_strength("Left")
	direction.y = Input.get_action_strength("Down") - Input.get_action_strength("Up")
	
func UpdateDirection():
	if direction == Vector2.ZERO:
		animation.stop()
	else:
		var direction = "_down"
		if velocity.y < 0: direction = "_up"
		elif velocity.x > 0: 
			$Sprite2D.flip_h = false
			direction = "_leftright"
		elif velocity.x < 0: 
			$Sprite2D.flip_h = true
			direction = "_leftright"
		
		animation.play("walk" + direction)

func _physics_process( delta ):
	var current_speed = movement_speed
	if Input.is_key_pressed(KEY_SHIFT): 
		current_speed = run_speed
	velocity = direction * current_speed
	move_and_slide()
	UpdateDirection()
