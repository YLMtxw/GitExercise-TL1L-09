extends Control

var menu : bool = false
var is_menu_open = false

func openMenu1():
	visible = true
	menu = true

func Mopen():
	if menu == true:
		is_menu_open = true
	return menu

func closeMenu1():
	visible = false
	menu = false

func Mclose():
	if menu == false:
		is_menu_open = false

func _on_vege_1_pressed() -> void:
	print("vege1")


func _on_mayo_1_pressed() -> void:
	print("mayo1")


func _on_tsauce_1_pressed() -> void:
	print("tsauce1")


func _on_chili_f_1_pressed() -> void:
	print("chili_f1")


func _on_oil_1_pressed() -> void:
	print("oil1")


func _on_stomato_1_pressed() -> void:
	print("stomato1")
