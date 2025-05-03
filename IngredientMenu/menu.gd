extends Control



var menu : bool = false

func openMenu1():
	visible = true
	menu = true

func closeMenu1():
	visible = false
	menu = false


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
