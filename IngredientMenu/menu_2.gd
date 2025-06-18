extends Control

var menu2 : bool = false
var is_menu_open = false
var inventory = preload("res://Inventory/playerInventory.tres")
@onready var inventorygui = get_node("/root/Playground/CanvasLayer/InventoryGUI")
@onready var click = $Clicksound

var item = null
var item_name : String = ""

func has_ingredients(dish: String) -> bool:
	if not RecipeDatabase.recipes.has(dish):
		print("Recipe not found:", dish)
		return false
	var required_counts := {}
	for name in RecipeDatabase.recipes[dish]:
		required_counts[name] = required_counts.get(name, 0) + 1
	var available_counts := {}
	for slot in inventory.slots:
		if slot.item and slot.itemNum > 0:
			available_counts[slot.item.name] = available_counts.get(slot.item.name, 0) + slot.itemNum
	for name in required_counts.keys():
		if available_counts.get(name, 0) < required_counts[name]:
			print("Missing ingredient:", name)
			return false
	return true

func consume_ingredients(dish: String):
	if not RecipeDatabase.recipes.has(dish):
		return
	var required_counts := {}
	for name in RecipeDatabase.recipes[dish]:
		required_counts[name] = required_counts.get(name, 0) + 1
	for name in required_counts.keys():
		var to_remove = required_counts[name]
		for slot in inventory.slots:
			if to_remove == 0:
				break
			if slot.item and slot.item.name == name:
				var remove_now = min(slot.itemNum, to_remove)
				inventory.remove_item(slot.item, remove_now)
				to_remove -= remove_now

func get_current_order_name(base_name: String) -> String:
	if OrderManager.current_order_data.has("base_name") and OrderManager.current_order_data["base_name"] == base_name:
		return OrderManager.current_order_data["name"]
	return base_name

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

# Cutting/Prep station handlers
func _on_vege_2_pressed() -> void:
	click.play()
	item = preload("res://Inventory/Item/sliced vege.tres")
	item_name = get_current_order_name("sliced vege")
	if has_ingredients(item_name):
		consume_ingredients(item_name)
		insert(item)
		inventorygui.update()
		print("Crafted sliced vege")
	else:
		print("Not enough ingredients (sliced vege)!")

func _on_stomato_2_pressed() -> void:
	click.play()
	item = preload("res://Inventory/Item/sliced tomato.tres")
	item_name = get_current_order_name("sliced tomato")
	if has_ingredients(item_name):
		consume_ingredients(item_name)
		insert(item)
		inventorygui.update()
		print("Crafted sliced tomato")
	else:
		print("Not enough ingredients (sliced tomato)!")

func _on_carrot_pressed() -> void:
	click.play()
	item = preload("res://Inventory/Item/carrot (sliced).tres")
	item_name = get_current_order_name("carrot (sliced)")
	if has_ingredients(item_name):
		consume_ingredients(item_name)
		insert(item)
		inventorygui.update()
		print("Crafted sliced carrot")
	else:
		print("Not enough ingredients (sliced carrot)!")

func _on_mayo_2_pressed() -> void:
	click.play()
	var item = preload("res://Inventory/Item/mayonaise.tres")
	print("mayonaise")
	inventorygui.update()
	insert(item)

func _on_tsauce_2_pressed() -> void:
	click.play()
	var item = preload("res://Inventory/Item/tomato sauce.tres")
	print("tomato sauce")
	inventorygui.update()
	insert(item)

func _on_oil_2_pressed() -> void:
	click.play()
	var item = preload("res://Inventory/Item/oil.tres")
	print("oil")
	inventorygui.update()
	insert(item)

func _on_bbqs_2_pressed() -> void:
	click.play()
	var item = preload("res://Inventory/Item/bbqs.tres")
	print("barbecue sauce")
	inventorygui.update()
	insert(item)

func _on_hot_water_pressed() -> void:
	click.play()
	var item = preload("res://Inventory/Item/hot water.tres")
	print("hot water")
	inventorygui.update()
	insert(item)
	
func _on_chili_flake_pressed() -> void:
	click.play()
	var item = preload("res://Inventory/Item/chili flake(real).tres")
	print("chili flake")
	inventorygui.update()
	insert(item)
