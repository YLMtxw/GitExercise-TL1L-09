extends Control

var menu2 : bool = false
var is_menu_open : bool = false

func openMenu2():
	visible = true
	menu2 = true

func Mopen2():
	if menu2 == true:
		is_menu_open = true
	return menu2

func closeMenu2():
	visible = false
	menu2 = false

func Mclose2():
	if menu2 == false:
		is_menu_open = false

func _on_vege_2_pressed() -> void:
	print("vege2")


func _on_stomato_2_pressed() -> void:
	print("stomato2")


func _on_mayo_2_pressed() -> void:
	print("mayo2")


func _on_tsauce_2_pressed() -> void:
	print("tsauce2")


func _on_chili_f_2_pressed() -> void:
	print("chili_f2")


func _on_oil_2_pressed() -> void:
	print("oil2")
