extends Control

var menu : bool = false
var is_menu_open = false
var inventory = preload("res://Inventory/playerInventory.tres")
@onready var inventorygui = get_node("/root/Playground/CanvasLayer/InventoryGUI")

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
		
func insert(item: InventoryItem) -> void:
	inventory.add_item(item)

func _on_vege_1_pressed() -> void:
	var item = preload("res://Inventory/Item/sliced vege.tres")
	print("vege1")
	inventorygui.update()
	insert(item)


func _on_mayo_1_pressed() -> void:
	var item = preload("res://Inventory/Item/mayonaise.tres")
	print("mayo1")
	inventorygui.update()
	insert(item)


func _on_tsauce_1_pressed() -> void:
	var item = preload("res://Inventory/Item/tomato sauce.tres")
	print("tsauce1")
	inventorygui.update()
	insert(item)


func _on_oil_1_pressed() -> void:
	var item = preload("res://Inventory/Item/oil.tres")
	print("oil1")
	inventorygui.update()
	insert(item)


func _on_stomato_1_pressed() -> void:
	var item = preload("res://Inventory/Item/sliced tomato.tres")
	print("stomato1")
	inventorygui.update()
	insert(item)


func _on_bbqs_pressed() -> void:
	var item = preload("res://Inventory/Item/bbqs.tres")
	print("chili_f1")
	inventorygui.update()
	insert(item)
