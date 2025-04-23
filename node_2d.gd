extends Node2D

func _ready():
	# 可选：播放音乐，设置默认状态等
	#TutorialPopup 是你场景中的一个节点（你这里就是 PopupPanel）
	#然后，hide解释说把大开着的窗口关闭
	$TutorialPopup.hide()

func _on_StartButton_pressed():
	print("按钮按到了！")
	get_tree().change_scene_to_file("res://Game01.tscn") # 改成你的主游戏场景路径

func _on_TutorialPopup_gui_input(event): #一旦，我打开了窗口后，我随便按一个地方，只要是窗口以外的地方，都可以直接关闭此窗口
	if event is InputEventMouseButton and event.pressed:
		$TutorialPopup.hide()


func _on_tutorial_button_pressed() -> void:
	$TutorialPopup.popup_centered()
