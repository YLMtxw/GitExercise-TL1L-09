extends Control

var refri : bool = false
var is_menu_open : bool = false

func openRefri():
	visible = true
	refri = true

func Ropen():
	if refri == true:
		is_menu_open = true
	return refri

func closeRefri():
	visible = false
	refri = false

func Rclose():
	if refri == false:
		is_menu_open = false


func _on_rvege_pressed() -> void:
	print("rvege")


func _on_rtomato_pressed() -> void:
	print("rtomato")


func _on_rspaghetti_pressed() -> void:
	print("rspaghetti")


func _on_beefsteak_pressed() -> void:
	print("beefsteak")


func _on_beefpatty_pressed() -> void:
	print("beefpatty")


func _on_lamb_pressed() -> void:
	print("lamb")

func _on_lambpatty_pressed() -> void:
	print("lambpatty")


func _on_chicken_pressed() -> void:
	print("chicken")


func _on_chickenpatty_pressed() -> void:
	print("chickenpatty")


func _on_rcheese_pressed() -> void:
	print("rcheese")


func _on_coke_pressed() -> void:
	pass # Replace with function body.


func _on__pressed() -> void:
	pass # Replace with function body.


func _on_up_pressed() -> void:
	pass # Replace with function body.


func _on_sprite_pressed() -> void:
	pass # Replace with function body.
