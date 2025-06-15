extends Control

var toaster1 : bool = false
var is_menu_open : bool = false
var locked : bool = false
@onready var toasterBar = get_node("/root/Playground/CanvasLayer/loadingBar3")
var inventory = preload("res://Inventory/playerInventory.tres")
@onready var inventorygui = get_node("/root/Playground/CanvasLayer/InventoryGUI")
@onready var click = $Clicksound

var item = null              # InventoryItem resource (.tres)
var item_name : String = ""  # The key for recipe lookups (could be modified!)

func _ready():
	for button in get_tree().get_nodes_in_group("toaster1"):
		if button is TextureButton:
			button.pressed.connect(_on_toaster1_button_pressed.bind(button))
			print("texture button")
	toasterBar.connect("loading_finished", Callable(self, "_on_loading_finished"))

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

func _on_toaster1_button_pressed(button: TextureButton):
	if item and item_name != "" and has_ingredients(item_name):
		locked = true
		print("Button pressed, showing bar...")
		consume_ingredients(item_name)
		toasterBar.show_bar()
		closeToaster1()
	else:
		print("You dont have enough ingredient to cook ", item_name)

func _on_loading_finished():
	if locked:
		locked = false
		print("Loading finished")
		if item:
			insert(item)
			inventorygui.update()
			print("Added item to inventory: ", item_name)
			item = null

func _on_timer_timeout(button):
	print("Timer for ", button.name, "finished!")

func insert(item: InventoryItem) -> void:
	inventory.add_item(item)

func openToaster1():
	if locked:
		return
	else:
		visible = true
		toaster1 = true

func t1open():
	if toaster1 == true:
		is_menu_open = true
	return toaster1

func closeToaster1():
	visible = false
	toaster1 = false

func t1close():
	if toaster1 == false:
		is_menu_open = false

# Sandwich selection handlers
func _on_vege_sandwich_pressed() -> void:
	click.play()
	item = preload("res://Inventory/Item/vege sandwich.tres").duplicate()
	item_name = get_current_order_name("vege sandwich")

func _on_egg_mayo_sandwich_pressed() -> void:
	click.play()
	item = preload("res://Inventory/Item/egg mayo sandwich.tres").duplicate()
	item_name = get_current_order_name("egg mayo sandwich")

func _on_chic_sandwich_pressed() -> void:
	click.play()
	item = preload("res://Inventory/Item/chicken sandwich.tres").duplicate()
	item_name = get_current_order_name("chicken sandwich")

func _on_lamb_sandwich_pressed() -> void:
	click.play()
	item = preload("res://Inventory/Item/lamb sandwich.tres").duplicate()
	item_name = get_current_order_name("lamb sandwich")

func _on_beef_sandwich_pressed() -> void:
	click.play()
	item = preload("res://Inventory/Item/beef sandwich.tres").duplicate()
	item_name = get_current_order_name("beef sandwich")
