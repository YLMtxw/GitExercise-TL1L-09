extends Control

var toaster1 : bool = false
var is_menu_open : bool = false
var locked : bool = false
@onready var toasterBar = get_node("/root/Playground/CanvasLayer/loadingBar3")
var inventory = preload("res://Inventory/playerInventory.tres")
@onready var inventorygui = get_node("/root/Playground/CanvasLayer/InventoryGUI")
var item = null
var recipes = {
	"egg mayo sandwich": ["fried egg", "mayonaise", "sliced vege", "sliced tomato", "cheese", "bread", "bread"],
	"chicken sandwich": ["chicken cooked", "sliced vege", "sliced tomato", "mayonaise", "cheese", "bread", "bread"],
	"lamb sandwich": ["lamb cooked", "sliced vege", "sliced tomato", "mayonaise", "cheese", "bread", "bread"],
	"beef sandwich": ["beef cooked", "sliced vege", "sliced tomato", "mayonaise", "cheese", "bread", "bread"],
	"vege sandwich": ["sliced vege", "sliced vege", "sliced tomato", "sliced tomato", "mayonaise", "bread", "bread"]
}


func _ready() :
	for button in get_tree().get_nodes_in_group("toaster1"):
		if button is TextureButton:
			button.pressed.connect(_on_toaster1_button_pressed.bind(button))
			print("texture button")
	
	toasterBar.connect("loading_finished", Callable(self, "_on_loading_finished"))

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

func _on_toaster1_button_pressed(button: TextureButton):
	if item and has_ingredients(item.name):
		locked = true
		print("Button pressed, showing bar...")
		consume_ingredients(item.name)
		toasterBar.show_bar()
		closeToaster1()
	else:
		print("You dont have enough ingredient to cook ", item.name)

func _on_loading_finished():
	if locked:
		locked = false
		print("Loading finished")
		
		if item:
			insert(item)
			inventorygui.update()  # ← Make sure this updates the UI
			print("Added item to inventory: ", item.name)
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


func _on_vege_sandwich_pressed() -> void:
	item = preload("res://Inventory/Item/vege sandwich.tres")
	pass # Replace with function body.


func _on_egg_mayo_sandwich_pressed() -> void:
	item = preload("res://Inventory/Item/egg mayo sandwich.tres")
	pass # Replace with function body.


func _on_chic_sandwich_pressed() -> void:
	item = preload("res://Inventory/Item/chicken sandwich.tres")
	pass # Replace with function body.


func _on_lamb_sandwich_pressed() -> void:
	item = preload("res://Inventory/Item/lamb sandwich.tres")
	pass # Replace with function body.


func _on_beef_sandwich_pressed() -> void:
	item = preload("res://Inventory/Item/beef sandwich.tres")
	pass # Replace with function body.
