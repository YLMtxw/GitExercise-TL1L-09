extends Button
func _on_StartButton_mouse_entered():
	$Node2D/AnimationPlayer.play("hover")

func _on_StartButton_mouse_exited():
	$Node2D/AnimationPlayer.play("shrink")
"res://photo/what-a-fuck-120320.wav"

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn")
