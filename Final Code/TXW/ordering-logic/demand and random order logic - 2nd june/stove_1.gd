extends Control

var stove1 : bool = false
var is_menu_open : bool = false
var locked : bool = false
@onready var stoveBar = get_node("/root/Playground/CanvasLayer/loadingBar1")
var inventory = preload("res://Inventory/playerInventory.tres")
@onready var inventorygui = get_node("/root/Playground/CanvasLayer/InventoryGUI")
var item = null
var recipes = {
	"spaghetti cooked": ["spaghetti raw"],
	"egg": ["raw egg", "oil"],
	"vege burger": ["bun","sliced vege", "cheese", "sliced tomato", "mayonaise"],
	"beef burger": ["bun", "cheese", "sliced vege", "beef patty cooked", "mayonaise"],
	"chicken burger": ["bun", "cheese", "sliced vege", "chicken patty cooked", "mayonaise"],
	"lamb burger": ["bun", "cheese", "sliced vege", "lamb patty cooked", "mayonaise"],
	"chicken patty cooked": ["chicken patty raw", "oil"],
	"beef patty cooked": ["beef patty raw", "oil"],
	"lamb patty cooked": ["lamb patty raw", "oil"],
	"aglio olio": ["spaghetti cooked", "oil"],
	"carbonara": ["spaghetti cooked", "fried egg", "chicken cooked"],
	"bolognese": ["spaghetti cooked", "tomato sauce", "beef cooked"],
	"beef cooked": ["beef raw"],
	"chicken cooked": ["chicken raw"],
	"lamb cooked": ["lamb raw"],
	"meat beef": ["beef raw", "oil", "bbqs", "sliced vege"],
	"meat chicken": ["chicken raw", "oil", "bbqs", "sliced vege"],
	"meat lamb": ["lamb raw", "oil", "bbqs", "sliced vege"]
}

func _ready() :
	for button in get_tree().get_nodes_in_group("stove1"):
		if button is TextureButton:
			button.pressed.connect(_on_stove1_button_pressed.bind(button))
			print("texture button")
	
	stoveBar.connect("loading_finished", Callable(self, "_on_loading_finished"))

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

func _on_stove1_button_pressed(button: TextureButton):
	if item and has_ingredients(item.name):
		locked = true
		print("Button pressed, showing bar...")
		consume_ingredients(item.name)
		stoveBar.show_bar()
		closeStove1()
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

func openStove1():
	if locked == true:
		return
	else:
		visible = true
		stove1 = true

func S1open():
	if stove1 == true:
		is_menu_open = true
	return stove1

func closeStove1():
	visible = false
	stove1 = false

func S1close():
	if stove1 == false:
		is_menu_open = false


func _on_vege_burger_pressed():
	item = preload("res://Inventory/Item/vege burger.tres")
	pass


func _on_egg_pressed() -> void:
	item = preload("res://Inventory/Item/fried egg.tres")
	pass # Replace with function body.


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
