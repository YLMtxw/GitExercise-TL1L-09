extends Control

var stove1 : bool = false
var is_menu_open : bool = false

func openStove1():
	visible = true
	stove1 = true

func S1open():
	if stove1 == true:
		is_menu_open = true
	return stove1

func closeStove1():
	visible = false
	stove1 = false

func S1close():
	if stove1 == false:
		is_menu_open = false


func _on_vege_burger_pressed() -> void:
	pass # Replace with function body.


func _on_egg_pressed() -> void:
	pass # Replace with function body.
