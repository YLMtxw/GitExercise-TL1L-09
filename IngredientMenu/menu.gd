extends Control

var menu : bool = false
var is_menu_open = false
var inventory = preload("res://Inventory/playerInventory.tres")
@onready var inventorygui = get_node("/root/Playground/CanvasLayer/InventoryGUI")
@onready var click = $Clicksound

func has_ingredients(dish: String) -> bool:
	# ... (copy the debug code and ingredient logic from other stations)
	if not RecipeDatabase.recipes.has(dish):
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
	click.play()

	if has_ingredients("vegetable (peeled)"):
		consume_ingredients("vegetable (peeled)")
		var item = preload("res://Inventory/Item/sliced vege.tres")
		insert(item)
		inventorygui.update()
		print("Crafted sliced vege")
	else:
		print("Not enough ingredients (sliced vege)!")


func _on_mayo_1_pressed() -> void:
	click.play()
	var item = preload("res://Inventory/Item/mayonaise.tres")
	print("mayo")
	inventorygui.update()
	insert(item)

func _on_tsauce_1_pressed() -> void:
	click.play()
	var item = preload("res://Inventory/Item/tomato sauce.tres")
	print("tsauce")
	inventorygui.update()
	insert(item)
	
func _on_oil_1_pressed() -> void:
	click.play()
	var item = preload("res://Inventory/Item/oil.tres")
	print("oil")
	inventorygui.update()
	insert(item)

func _on_stomato_1_pressed() -> void:
	click.play()
	if has_ingredients("tomato (sliced)"):
		consume_ingredients("tomato (sliced)")
		var item = preload("res://Inventory/Item/sliced tomato.tres")
		insert(item)
		inventorygui.update()
		print("Crafted sliced tomato")
	else:
		print("Not enough ingredients (sliced tomato)!")

func _on_bbqs_pressed() -> void:
	click.play()
	var item = preload("res://Inventory/Item/bbqs.tres")
	print("bbqs")
	inventorygui.update()
	insert(item)
 

func _on_carrot_pressed() -> void:
	click.play()
	if has_ingredients("carrot (sliced)"):
		consume_ingredients("carrot (sliced)")
		var item = preload("res://Inventory/Item/carrot (sliced).tres")
		insert(item)
		inventorygui.update()
		print("Crafted sliced carrot")
	else:
		print("Not enough ingredients (sliced carrot)!")


func _on_hot_water_pressed() -> void:
	click.play()
	var item = preload("res://Inventory/Item/hot water.tres")
	print("hot water")
	inventorygui.update()
	insert(item)
	pass # Replace with function body.


func _on_chili_flake_pressed() -> void:
	click.play()
	var item = preload("res://Inventory/Item/chili flake(real).tres")
	print("chili flake")
	inventorygui.update()
	insert(item)
	pass # Replace with function body.
