extends Control

var toaster2 : bool = false
var is_menu_open : bool = false
var locked : bool = false
@onready var toasterBar = get_node("/root/Playground/CanvasLayer/loadingBar3")
var inventory = preload("res://Inventory/playerInventory.tres")
@onready var inventorygui = get_node("/root/Playground/CanvasLayer/InventoryGUI")
var item = null

func _ready():
	for button in get_tree().get_nodes_in_group("toaster2"):
		if button is TextureButton:
			button.pressed.connect(_on_toaster2_button_pressed.bind(button))
			print("texture button")
	toasterBar.connect("loading_finished", Callable(self, "_on_loading_finished"))

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

func _on_toaster2_button_pressed(button: TextureButton):
	if item and has_ingredients(item.name):
		locked = true
		print("Button pressed, showing bar...")
		consume_ingredients(item.name)
		toasterBar.show_bar()
		closeToaster2()
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

func openToaster2():
	if locked:
		return
	else:
		visible = true
		toaster2 = true

func t2open():
	if toaster2 == true:
		is_menu_open = true
	return toaster2

func closeToaster2():
	visible = false
	toaster2 = false

func t2close():
	if toaster2 == false:
		is_menu_open = false

func _on_vege_sandwich_pressed() -> void:
	item = preload("res://Inventory/Item/vege sandwich.tres")

func _on_egg_mayo_sandwich_pressed() -> void:
	item = preload("res://Inventory/Item/egg mayo sandwich.tres")

func _on_chic_sandwich_pressed() -> void:
	item = preload("res://Inventory/Item/chicken sandwich.tres")

func _on_lamb_sandwich_pressed() -> void:
	item = preload("res://Inventory/Item/lamb sandwich.tres")

func _on_beef_sandwich_pressed() -> void:
	item = preload("res://Inventory/Item/beef sandwich.tres")
