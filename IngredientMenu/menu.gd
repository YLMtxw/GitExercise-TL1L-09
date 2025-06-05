extends Control

var menu : bool = false
var is_menu_open = false
var inventory = preload("res://Inventory/playerInventory.tres")
@onready var inventorygui = get_node("/root/Playground/CanvasLayer/InventoryGUI")
var recipes = {
	"vegetable (peeled)": ["vegetable"],
	"tomato (sliced)": ["tomato"]
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
		print("Not enough ingredients!")

func _on_mayo_1_pressed() -> void:
	click.play()
	var item = preload("res://Inventory/Item/mayonaise.tres")
	print("mayo1")
	inventorygui.update()
	insert(item)

func _on_tsauce_1_pressed() -> void:
	click.play()
	var item = preload("res://Inventory/Item/tomato sauce.tres")
	print("tsauce1")
	inventorygui.update()
	insert(item)


func _on_oil_1_pressed() -> void:
	click.play()
	var item = preload("res://Inventory/Item/oil.tres")
	print("oil1")
	inventorygui.update()
	insert(item)


func _on_stomato_1_pressed() -> void:
	click.play()
	if has_ingredients("tomato (sliced)"):
		consume_ingredients("tomato (sliced)")
		var item = preload("res://Inventory/Item/sliced tomato.tres")
		insert(item)
		inventorygui.update()
		print("Crafted sliced vege")
	else:
		print("Not enough ingredients!")


func _on_bbqs_pressed() -> void:
	click.play()
	var item = preload("res://Inventory/Item/bbqs.tres")
	print("chili_f1")
	inventorygui.update()
	insert(item)
