extends Control

var setting_visibility : bool = false
var scene = "res://playground.tscn"

const data = preload("res://Global.gd")

		
@onready var slider: HSlider = $Setting/HSlider

func _ready():
	
	# 确保加载音量（如果你想确保最新文件）
	Global.load_volume()

	# 应用到音频总线
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), Global.volume_db)

	# 初始化滑块到全局音量
	if slider != null :

	# 监听滑块
		slider.value_changed.connect(_on_h_slider_value_changed)
		Global.volume_changed.connect(_on_global_volume_changed)
		
		
	var bus_index = AudioServer.get_bus_index("Master")
	AudioServer.set_bus_volume_db(bus_index, Global.volume_db)
	$Setting/HSlider.value = Global.volume_db
	process_mode = PROCESS_MODE_ALWAYS

func _on_h_slider_value_changed(value):
	Global.apply_volume()
	
	var bus_index = AudioServer.get_bus_index("Master")
	AudioServer.set_bus_volume_db(bus_index, value)
	AudioServer.set_bus_mute(bus_index, value <= -60)
	Global.volume_db = value

func _on_global_volume_changed(new_value: float):
	slider.value = new_value
	

func open_setting():
	visible = true
	setting_visibility = true

func close_setting():
	visible = false 
	setting_visibility = false


func _on_quit_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.




func _on_button_resume_pressed() -> void:
	visible = false
	setting_visibility = false
	get_tree().paused = false
