extends Node2D

@onready var bgm = $AudioStreamPlayer
var last_saved_position := Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.load_game(Global.current_store_name)
	bgm.play()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
