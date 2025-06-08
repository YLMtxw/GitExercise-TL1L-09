extends Control

var setting_visibility : bool = false

func open_setting():
	visible = true
	setting_visibility = true

func close_setting():
	visible = false 
	setting_visibility = false
