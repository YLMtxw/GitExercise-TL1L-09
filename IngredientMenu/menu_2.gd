extends Control

var menu2 : bool = false
var is_menu_open = false
var inventory = preload("res://Inventory/playerInventory.tres")
@onready var inventorygui = get_node("/root/Playground/CanvasLayer/InventoryGUI")

func has_ingredients(dish: String) -> bool:
	var dish_lc = dish.to_lower()
	if not RecipeDatabase.recipes.has(dish_lc):
		print("Recipe not found (cutting):", dish_lc)
		print("Available recipes:", RecipeDatabase.recipes.keys())
		return false

	var required = RecipeDatabase.recipes[dish_lc]
	var available = inventory.slots

	for ingredient_name in required:
		var found = false
		for slot in available:
			if slot.item and slot.item.name == ingredient_name and slot.itemNum > 0:
				found = true
				break
		if not found:
			print("Missing ingredient (cutting): ", ingredient_name)
			return false

	return true

func consume_ingredients(dish: String):
	var dish_lc = dish.to_lower()
	if not RecipeDatabase.recipes.has(dish_lc):
		return

	for ingredient_name in RecipeDatabase.recipes[dish_lc]:
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
	if has_ingredients("sliced vege"):
		consume_ingredients("sliced vege")
		var item = preload("res://Inventory/Item/sliced vege.tres")
		insert(item)
		inventorygui.update()
		print("Crafted sliced vege")
	else:
		print("Not enough ingredients (sliced vege)!")

func _on_mayo_2_pressed() -> void:
	var item = preload("res://Inventory/Item/mayonaise.tres")
	print("mayo")
	inventorygui.update()
	insert(item)

func _on_tsauce_2_pressed() -> void:
	var item = preload("res://Inventory/Item/tomato sauce.tres")
	print("tsauce")
	inventorygui.update()
	insert(item)

func _on_oil_2_pressed() -> void:
	var item = preload("res://Inventory/Item/oil.tres")
	print("oil")
	inventorygui.update()
	insert(item)

func _on_stomato_2_pressed() -> void:
	if has_ingredients("sliced tomato"):
		consume_ingredients("sliced tomato")
		var item = preload("res://Inventory/Item/sliced tomato.tres")
		insert(item)
		inventorygui.update()
		print("Crafted sliced tomato")
	else:
		print("Not enough ingredients (sliced tomato)!")

func _on_bbqs_2_pressed() -> void:
	var item = preload("res://Inventory/Item/bbqs.tres")
	print("bbqs")
	inventorygui.update()
	insert(item)
