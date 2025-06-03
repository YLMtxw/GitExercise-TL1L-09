extends Control

var menu2 : bool = false
var is_menu_open : bool = false
var inventory = preload("res://Inventory/playerInventory.tres")
@onready var inventorygui = get_node("/root/Playground/CanvasLayer/InventoryGUI")
var recipes = {
	"sliced vege": ["vegetable"],
	"sliced tomato": ["tomato"]
}
@onready var click = $Clicksound

func has_ingredients(dish: String) -> bool:
	if not recipes.has(dish):
		return false

	var required = recipes[dish]
	var available = inventory.slots

	for ingredient_name in required:
		var found = false
		for slot in available:
			if slot.item and slot.item.name == ingredient_name and slot.itemNum > 0:
				found = true
				break
		if not found:
			print("Missing ingredient: ", ingredient_name)
			return false

	return true

func consume_ingredients(dish: String):
	if not recipes.has(dish):
		return

	for ingredient_name in recipes[dish]:
		for slot in inventory.slots:
			if slot.item and slot.item.name == ingredient_name:
				inventory.remove_item(slot.item, 1)
				break

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
	click.play()
	if has_ingredients("sliced vege"):
		consume_ingredients("sliced vege")
		var item = preload("res://Inventory/Item/sliced vege.tres")
		insert(item)
		inventorygui.update()
		print("Crafted sliced vege")
	else:
		print("Not enough ingredients!")


func _on_stomato_2_pressed() -> void:
	click.play()
	if has_ingredients("sliced tomato"):
		consume_ingredients("sliced tomato")
		var item = preload("res://Inventory/Item/sliced tomato.tres")
		insert(item)
		inventorygui.update()
		print("Crafted sliced vege")
	else:
		print("Not enough ingredients!")


func _on_mayo_2_pressed() -> void:
	click.play()
	var item = preload("res://Inventory/Item/mayonaise.tres")
	print("mayo2")
	inventorygui.update()
	insert(item)


func _on_tsauce_2_pressed() -> void:
	click.play()
	var item = preload("res://Inventory/Item/tomato sauce.tres")
	print("tsauce2")
	inventorygui.update()
	insert(item)


func _on_oil_2_pressed() -> void:
	click.play()
	var item = preload("res://Inventory/Item/oil.tres")
	print("oil2")
	inventorygui.update()
	insert(item)


func _on_bbqs_2_pressed() -> void:
	click.play()
	var item = preload("res://Inventory/Item/bbqs.tres")
	print("chili_f2")
	inventorygui.update()
	insert(item)
	pass # Replace with function body.
