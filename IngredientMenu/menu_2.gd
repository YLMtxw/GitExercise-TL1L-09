extends Control

var menu2 : bool = false
var is_menu_open : bool = false
var inventory = preload("res://Inventory/playerInventory.tres")
@onready var inventorygui = get_node("/root/Playground/CanvasLayer/InventoryGUI")

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

func insert(item: InventoryItem) -> void:
	inventory.add_item(item)

func _on_vege_2_pressed() -> void:
	var item = preload("res://Inventory/Item/sliced vege.tres")
	print("vege2")
	inventorygui.update()
	insert(item)


func _on_stomato_2_pressed() -> void:
	var item = preload("res://Inventory/Item/sliced tomato.tres")
	print("stomato2")
	inventorygui.update()
	insert(item)


func _on_mayo_2_pressed() -> void:
	var item = preload("res://Inventory/Item/mayonaise.tres")
	print("mayo2")
	inventorygui.update()
	insert(item)


func _on_tsauce_2_pressed() -> void:
	var item = preload("res://Inventory/Item/tomato sauce.tres")
	print("tsauce2")
	inventorygui.update()
	insert(item)


func _on_oil_2_pressed() -> void:
	var item = preload("res://Inventory/Item/oil.tres")
	print("oil2")
	inventorygui.update()
	insert(item)


func _on_bbqs_2_pressed() -> void:
	var item = preload("res://Inventory/Item/bbqs.tres")
	print("chili_f2")
	inventorygui.update()
	insert(item)
	pass # Replace with function body.
