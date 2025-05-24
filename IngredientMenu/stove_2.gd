extends Control

var stove2 : bool = false
var is_menu_open : bool = false
var locked : bool = false
@onready var stoveBar2 = get_node("/root/Playground/CanvasLayer/loadingBar2")
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
	for button in get_tree().get_nodes_in_group("stove2"):
		if button is TextureButton:
			button.pressed.connect(_on_stove2_button_pressed.bind(button))
			print("texture button")
	
	stoveBar2.connect("loading_finished", Callable(self, "_on_loading_finished"))

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

func _on_stove2_button_pressed(button: TextureButton):
	if item and has_ingredients(item.name):
		locked = true
		print("Button pressed, showing bar...")
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
			inventorygui.update()  # ← Make sure this updates the UI
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
