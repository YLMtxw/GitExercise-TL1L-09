extends Node2D

func _ready():
	pass


	

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "fade_out":
		var new_scene = load("res://PlayerInfo.tscn").instantiate()
		get_tree().root.add_child(new_scene)
		get_tree().current_scene.queue_free()
		get_tree().current_scene = new_scene


func _on_TutorialPopup_gui_input(event): #一旦，我打开了窗口后，我随便按一个地方，只要是窗口以外的地方，都可以直接关闭此窗口
	if event is InputEventMouseButton and event.pressed:
		$PopupPanel.hide()


func _on_tutorial_button_pressed() -> void:
	$ClickSound.play()
	$PopupPanel.popup_centered()


func _on_start_button_pressed() -> void:
	$ClickSound.play()
	get_tree().change_scene_to_file("res://PlayerInfo.tscn")


func _on_texture_button_pressed() -> void:
	$ClickSound.play()
	get_tree().change_scene_to_file("res://PlayerInfo.tscn")


func _on_start_button_2_pressed() -> void:
	$ClickSound.play()
	get_tree().change_scene_to_file("res://PlayerInfo.tscn")
