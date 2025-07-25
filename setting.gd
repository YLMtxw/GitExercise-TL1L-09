extends Control

var setting_visibility : bool = false
var scene = "res://playground.tscn"

		
func _ready():
	Global.load_game("profile")
	var bus_index = AudioServer.get_bus_index("Master")
	AudioServer.set_bus_volume_db(bus_index, Global.volume_db)
	$Setting/HSlider.value = Global.volume_db
	process_mode = PROCESS_MODE_ALWAYS
	
	
	

func open_setting():
	visible = true
	setting_visibility = true

func close_setting():
	visible = false 
	setting_visibility = false


func _on_quit_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.


func _on_volume_slider_value_changed(value):
	var bus_index = AudioServer.get_bus_index("Master")
	AudioServer.set_bus_volume_db(bus_index, value)
	AudioServer.set_bus_mute(bus_index, value <= -60)
	Global.volume_db = value
	Global.save_game()


func _on_button_resume_pressed() -> void:
	visible = false
	setting_visibility = false
	get_tree().paused = false


func _on_h_slider_value_changed(value: float) -> void:
	var bus_index = AudioServer.get_bus_index("Master")
	AudioServer.set_bus_volume_db(bus_index, value)
	AudioServer.set_bus_mute(bus_index, value <= -60)
	Global.volume_db = value
	Global.save_game()
	pass # Replace with function body.
