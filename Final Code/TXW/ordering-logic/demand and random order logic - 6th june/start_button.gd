extends Button

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _on_StartButton_pressed():
	$ClickSound.play()  # 播放按钮声音
	get_tree().change_scene_to_file("res://PlayerInfo.tscn")
