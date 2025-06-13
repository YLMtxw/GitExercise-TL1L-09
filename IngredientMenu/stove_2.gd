extends Control

var stove2 : bool = false
var is_menu_open : bool = false
var locked : bool = false
@onready var stoveBar2 = get_node("/root/Playground/CanvasLayer/loadingBar2")
var inventory = preload("res://Inventory/playerInventory.tres")
@onready var inventorygui = get_node("/root/Playground/CanvasLayer/InventoryGUI")
var item = null
var recipes = {
	"spaghetti (cooked)": ["spaghetti (raw)"],
	"egg": ["egg (raw)", "oil"],
	"vegetable burger": ["bun","vegetable (peeled)", "cheese", "tomato (sliced)", "mayonaise"],
	"beef burger": ["bun", "cheese", "vegetable (peeled)", "beef patty cooked", "mayonaise"],
	"chicken burger": ["bun", "cheese", "vegetable (peeled)", "chicken patty (grilled)", "mayonaise"],
	"lamb burger": ["bun", "cheese", "vegetable (peeled)", "lamb patty (grilled)", "mayonaise"],
	"chicken patty (grilled)": ["chicken patty (raw)", "oil"],
	"beef patty (grilled)": ["beef patty (raw)", "oil"],
	"lamb patty (grilled)": ["lamb patty (raw)", "oil"],
	"Aglio Olio": ["spaghetti (cooked)", "oil","chili flake","chicken (grilled)"],
	"carbonara": ["spaghetti (cooked)", "fried egg", "chicken (grilled)","cheese"],
	"bolognese": ["spaghetti (cooked)", "tomato sauce", "beef (grilled)"],
	"beef (grilled)": ["beef (raw)"],
	"chicken (grilled)": ["chicken (raw)"],
	"lamb (grilled)": ["lamb (raw)"],
	"Grilled Beef Steak": ["beef (raw)", "oil", "Barbecue Sauce", "vegetable (peeled)","carrot (sliced)"],
	"Grilled Chicken Steak": ["chicken (raw)", "oil", "Barbecue Sauce", "vegetable (peeled)","carrot (sliced)"],
	"Grilled Lamb Steak": ["lamb (raw)", "oil", "Barbecue Sauce", "vegetable (peeled)","carrot (sliced)"]
}
@onready var click = $Clicksound

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

func consume_ingredients(dish: String):
	if not recipes.has(dish):
		return

	for ingredient_name in recipes[dish]:
		for slot in inventory.slots:
			if slot.item and slot.item.name == ingredient_name:
				inventory.remove_item(slot.item, 1)
				break


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
	click.play()
	item = preload("res://Inventory/Item/spaghetti cooked.tres")
	pass # Replace with function body.


func _on_aglio_olio_pressed() -> void:
	click.play()
	item = preload("res://Inventory/Item/aglio olio.tres")
	pass # Replace with function body.


func _on_carbo_pressed() -> void:
	click.play()
	item = preload("res://Inventory/Item/carbonara.tres")
	pass # Replace with function body.


func _on_bolognese_pressed() -> void:
	click.play()
	item = preload("res://Inventory/Item/bolognese.tres")
	pass # Replace with function body.


func _on_beef_cooked_pressed() -> void:
	click.play()
	item = preload("res://Inventory/Item/beef cooked.tres")
	pass # Replace with function body.


func _on_pattyb_cooked_pressed() -> void:
	click.play()
	item = preload("res://Inventory/Item/beef patty cooked.tres")
	pass # Replace with function body.


func _on_lamb_cooked_pressed() -> void:
	click.play()
	item = preload("res://Inventory/Item/lamb cooked.tres")
	pass # Replace with function body.


func _on_pattyl_cooked_pressed() -> void:
	click.play()
	item = preload("res://Inventory/Item/lamb patty cooked.tres")
	pass # Replace with function body.


func _on_chicken_cooked_pressed() -> void:
	click.play()
	item = preload("res://Inventory/Item/chicken cooked.tres")
	pass # Replace with function body.


func _on_pattyc_cooked_pressed() -> void:
	click.play()
	item = preload("res://Inventory/Item/chicken patty cooked.tres")
	pass # Replace with function body.


func _on_beef_steak_pressed() -> void:
	click.play()
	item = preload("res://Inventory/Item/meat beef.tres")
	pass # Replace with function body.


func _on_beef_burger_pressed() -> void:
	click.play()
	item = preload("res://Inventory/Item/beef burger.tres")
	pass # Replace with function body.


func _on_lamb_pressed() -> void:
	click.play()
	item = preload("res://Inventory/Item/meat lamb.tres")
	pass # Replace with function body.


func _on_lamb_burger_pressed() -> void:
	click.play()
	item = preload("res://Inventory/Item/lamb burger.tres")
	pass # Replace with function body.


func _on_chicken_pressed() -> void:
	click.play()
	item = preload("res://Inventory/Item/meat chicken.tres")
	pass # Replace with function body.


func _on_chicken_burger_pressed() -> void:
	click.play()
	item = preload("res://Inventory/Item/chicken burger.tres")
	pass # Replace with function body.


func _on_vege_burger_pressed() -> void:
	click.play()
	item = preload("res://Inventory/Item/vege burger.tres")
	pass # Replace with function body.


func _on_egg_pressed() -> void:
	click.play()
	item = preload("res://Inventory/Item/fried egg.tres")
	pass # Replace with function body.
