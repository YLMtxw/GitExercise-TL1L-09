extends CharacterBody2D

const  movement_speed : int = 150
const run_speed : int = 225
#vector2 contain 2 num, x and y
var direction : Vector2 = Vector2.ZERO
var store_direction : Vector2 = Vector2.DOWN
@onready var animation = $AnimationPlayer

func _process( delta ):
	direction.x = Input.get_action_strength("Right") - Input.get_action_strength("Left")
	direction.y = Input.get_action_strength("Down") - Input.get_action_strength("Up")
	
	if direction != Vector2.ZERO:
		store_direction = direction

func UpdateAction():
	var action = "walk_down"
	if store_direction.y < 0: action = "walk_up"
	elif store_direction.x > 0: 
		$Sprite2D.flip_h = false
		action = "walk_leftright"
	elif store_direction.x < 0: 
		$Sprite2D.flip_h = true
		action = "walk_leftright"
	
	if direction == Vector2.ZERO:
		animation.stop()
	else:
		animation.play(action)


func _physics_process( delta ):
	var current_speed = movement_speed
	if Input.is_key_pressed(KEY_SHIFT): 
		current_speed = run_speed
	velocity = direction * current_speed
	move_and_slide()
	UpdateAction()        
