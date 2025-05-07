extends Control

var toaster1 : bool = false
var is_menu_open : bool = false

func openToaster1():
	visible = true
	toaster1 = true

func t1open():
	if toaster1 == true:
		is_menu_open = true
	return toaster1

func closeToaster1():
	visible = false
	toaster1 = false

func t1close():
	if toaster1 == false:
		is_menu_open = false


func _on_vege_sandwich_pressed() -> void:
	pass # Replace with function body.


func _on_egg_mayo_sandwich_pressed() -> void:
	pass # Replace with function body.


func _on_chic_sandwich_pressed() -> void:
	pass # Replace with function body.


func _on_lamb_sandwich_pressed() -> void:
	pass # Replace with function body.


func _on_beef_sandwich_pressed() -> void:
	pass # Replace with function body.
