extends Node2D

@onready var Setting = $"Setting"
@onready var slider = $PopupPanel2/Setting/HSlider

const data = preload("res://Global.gd")



func _input(event):

	if event is InputEventKey and event.pressed and event.keycode == KEY_ESCAPE:
		get_tree().quit()


func _ready():
	# 可选：每次进入场景先加载一次
	Global.load_game("profile")
	Global.load_volume()

	# 初始化滑块
	slider.value = Global.volume_db

	# 信号
	slider.value_changed.connect(_on_h_slider_value_changed)
	
	

func _on_h_slider_value_changed(value):
	Global.volume_db = value
	Global.save_volume()
	# 应用到音频总线（假设使用 "Master" 总线）
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), value)

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "fade_out":
		var new_scene = load("res://PlayerInfo.tscn").instantiate()
		get_tree().root.add_child(new_scene)
		get_tree().current_scene.queue_free()
		get_tree().current_scene = new_scene

func _on_SettingPopup_gui_input(event): #
	if event is InputEventMouseButton and event.pressed:
		$Setting.hide()
		
func _on_TutorialPopup_gui_input(event): #一旦，我打开了窗口后，我随便按一个地方，只要是窗口以外的地方，都可以直接关闭此窗口
	if event is InputEventMouseButton and event.pressed:
		$PopupPanel.hide()
		


func _on_tutorial_button_pressed() -> void:
	$ClickSound.play()
	$PopupPanel.popup_centered()


func _on_start_button_2_pressed() -> void:
	$ClickSound.play()
	await $ClickSound.finished
	if FileAccess.file_exists("user://profile.json"):
		print("✅ 检测到已存在玩家资料，直接跳转主游戏")
		Global.load_game("profile")  # Load existing profile
		get_tree().change_scene_to_file("res://playground.tscn")
	else:
		print("🆕 第一次启动游戏，进入创建资料页面")
		get_tree().change_scene_to_file("res://PlayerInfo.tscn")




func _on_setting_button_pressed() -> void:
	$ClickSound.play()
	$PopupPanel2.popup_centered()



func _on_h_slider_value_changed(value: float) -> void:
	var bus_index = AudioServer.get_bus_index("Master")
	AudioServer.set_bus_volume_db(bus_index, value)
	AudioServer.set_bus_mute(bus_index, value <= -60)
	Global.volume_db = value
	Global.save_game()

		
