extends Control

var stove2 : bool = false
var is_menu_open : bool = false

func openStove2():
	visible = true
	stove2 = true

func S2open():
	if stove2 == true:
		is_menu_open = true
	return stove2

func closeStove2():
	visible = false
	stove2 = false

func S2close():
	if stove2 == false:
		is_menu_open = false


func _on_spaghetti_cooked_pressed() -> void:
	pass # Replace with function body.


func _on_aglio_olio_pressed() -> void:
	pass # Replace with function body.


func _on_bolognese_pressed() -> void:
	pass # Replace with function body.


func _on_carbonara_pressed() -> void:
	pass # Replace with function body.


func _on_beef_cooked_pressed() -> void:
	pass # Replace with function body.


func _on_pattyb_cooked_pressed() -> void:
	pass # Replace with function body.


func _on_lamb_cooked_pressed() -> void:
	pass # Replace with function body.


func _on_pattyl_cooked_pressed() -> void:
	pass # Replace with function body.


func _on_chicken_cooked_pressed() -> void:
	pass # Replace with function body.


func _on_pattyc_cooked_pressed() -> void:
	pass # Replace with function body.


func _on_beef_steak_pressed() -> void:
	pass # Replace with function body.


func _on_beef_burger_pressed() -> void:
	pass # Replace with function body.


func _on_lamb_pressed() -> void:
	pass # Replace with function body.


func _on_lamb_burger_pressed() -> void:
	pass # Replace with function body.


func _on_chicken_pressed() -> void:
	pass # Replace with function body.


func _on_chicken_burger_pressed() -> void:
	pass # Replace with function body.
