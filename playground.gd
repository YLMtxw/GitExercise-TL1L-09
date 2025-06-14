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


func _on_menu_pressed_pressed() -> void:
	$"Sound Effect".play()
	get_tree().change_scene_to_file("res://menu.tscn")

func _on_hslider_value_changed(value):
	Global.volume_db = value
	Global.apply_volume()
