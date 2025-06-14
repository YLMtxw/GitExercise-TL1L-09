extends Control

var stove2 : bool = false
var is_menu_open : bool = false
var locked : bool = false
@onready var stoveBar2 = get_node("/root/Playground/CanvasLayer/loadingBar2")
var inventory = preload("res://Inventory/playerInventory.tres")
@onready var inventorygui = get_node("/root/Playground/CanvasLayer/InventoryGUI")
var item = null

func _ready():
	for button in get_tree().get_nodes_in_group("stove2"):
		if button is TextureButton:
			button.pressed.connect(_on_stove2_button_pressed.bind(button))
			print("texture button")
	stoveBar2.connect("loading_finished", Callable(self, "_on_loading_finished"))

func has_ingredients(dish: String) -> bool:
	var dish_lc = dish.to_lower()
	if not RecipeDatabase.recipes.has(dish_lc):
		print("Recipe not found:", dish_lc)
		print("Available recipes:", RecipeDatabase.recipes.keys())
		return false

	var required_counts := {}
	for name in RecipeDatabase.recipes[dish_lc]:
		required_counts[name] = required_counts.get(name, 0) + 1

	var available_counts := {}
	for slot in inventory.slots:
		if slot.item and slot.itemNum > 0:
			available_counts[slot.item.name] = available_counts.get(slot.item.name, 0) + slot.itemNum

	for name in required_counts.keys():
		if available_counts.get(name, 0) < required_counts[name]:
			print("Missing ingredient: ", name)
			return false
	return true

func consume_ingredients(dish: String):
	var dish_lc = dish.to_lower()
	if not RecipeDatabase.recipes.has(dish_lc):
		return

	var required_counts := {}
	for name in RecipeDatabase.recipes[dish_lc]:
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

func _on_stove2_button_pressed(button: TextureButton):
	if item and has_ingredients(item.name):
		locked = true
		print("Button pressed, showing bar...")
		consume_ingredients(item.name)
		stoveBar2.show_bar()
		closeStove2()
	else:
		print("You dont have enough ingredient to cook ", item.name)

func _on_loading_finished():
	if locked:
		locked = false
		print("Loading finished")
		if item:
			insert(item)
			inventorygui.update()
			print("Added item to inventory: ", item.name)
			item = null

func _on_timer_timeout(button):
	print("Timer for ", button.name, "finished!")

func insert(item: InventoryItem) -> void:
	inventory.add_item(item)

func openStove2():
	if locked:
		return
	else:
		visible = true
		stove2 = true

func S2open():
	if stove2 == true:
		is_menu_open = true
	return stove2

func closeStove2():
	visible = false
	stove2 = false

func S2close():
	if stove2 == false:
		is_menu_open = false

func _on_spaghetti_cooked_pressed() -> void:
	item = preload("res://Inventory/Item/spaghetti cooked.tres")
	pass # Replace with function body.

func _on_aglio_olio_pressed() -> void:
	item = preload("res://Inventory/Item/aglio olio.tres")
	pass # Replace with function body.

func _on_carbo_pressed() -> void:
	item = preload("res://Inventory/Item/carbonara.tres")
	pass # Replace with function body.

func _on_bolognese_pressed() -> void:
	item = preload("res://Inventory/Item/bolognese.tres")
	pass # Replace with function body.

func _on_beef_cooked_pressed() -> void:
	item = preload("res://Inventory/Item/beef cooked.tres")
	pass # Replace with function body.

func _on_pattyb_cooked_pressed() -> void:
	item = preload("res://Inventory/Item/beef patty cooked.tres")
	pass # Replace with function body.

func _on_lamb_cooked_pressed() -> void:
	item = preload("res://Inventory/Item/lamb cooked.tres")
	pass # Replace with function body.

func _on_pattyl_cooked_pressed() -> void:
	item = preload("res://Inventory/Item/lamb patty cooked.tres")
	pass # Replace with function body.

func _on_chicken_cooked_pressed() -> void:
	item = preload("res://Inventory/Item/chicken cooked.tres")
	pass # Replace with function body.

func _on_pattyc_cooked_pressed() -> void:
	item = preload("res://Inventory/Item/chicken patty cooked.tres")
	pass # Replace with function body.

func _on_beef_steak_pressed() -> void:
	item = preload("res://Inventory/Item/meat beef.tres")
	pass # Replace with function body.

func _on_beef_burger_pressed() -> void:
	item = preload("res://Inventory/Item/beef burger.tres")
	pass # Replace with function body.

func _on_lamb_pressed() -> void:
	item = preload("res://Inventory/Item/meat lamb.tres")
	pass # Replace with function body.

func _on_lamb_burger_pressed() -> void:
	item = preload("res://Inventory/Item/lamb burger.tres")
	pass # Replace with function body.

func _on_chicken_pressed() -> void:
	item = preload("res://Inventory/Item/meat chicken.tres")
	pass # Replace with function body.

func _on_chicken_burger_pressed() -> void:
	item = preload("res://Inventory/Item/chicken burger.tres")
	pass # Replace with function body.

func _on_vege_burger_pressed() -> void:
	item = preload("res://Inventory/Item/vege burger.tres")
	pass # Replace with function body.

func _on_egg_pressed() -> void:
	item = preload("res://Inventory/Item/fried egg.tres")
	pass # Replace with function body.
