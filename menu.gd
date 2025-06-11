extends Node2D

func _input(event):
	if event is InputEventKey and event.pressed and event.keycode == KEY_ESCAPE:
		get_tree().quit()

func _on_texture_button_pressed() -> void:
	$ClickSound.play()
	get_tree().change_scene_to_file("res://menu2.tscn")
