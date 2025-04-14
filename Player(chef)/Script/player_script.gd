class_name player_character extends CharacterBody2D

var movement_speed : int = 100
#vector2 contain 2 num, x and y
var direction : Vector2 = Vector2.ZERO
var ori_direction : Vector2 = Vector2.DOWN
var state : String = "idle"

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite_2d: Sprite2D = $Sprite2D


func _ready():
	pass
	
func _process( delta ):
	
	direction.x = Input.get_action_strength("Right") - Input.get_action_strength("Left")
	direction.y = Input.get_action_strength("Down") - Input.get_action_strength("Up")
	velocity = direction * movement_speed
	Animation()
	

func _physics_process( delta ):
	move_and_slide()
	
func Direction() -> bool:
	return true
	
func State() -> bool:
	return true

func Animation() -> void:
	animation_player.play("idle_down")
	pass
