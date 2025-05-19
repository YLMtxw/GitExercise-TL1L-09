extends Control

var toaster1 : bool = false
var is_menu_open : bool = false
var locked : bool = false
@onready var toasterBar = get_node("/root/Playground/CanvasLayer/loadingBar3")
var inventory = preload("res://Inventory/playerInventory.tres")
@onready var inventorygui = get_node("/root/Playground/CanvasLayer/InventoryGUI")
var item = null


func _ready() :
	for button in get_tree().get_nodes_in_group("toaster1"):
		if button is TextureButton:
			button.pressed.connect(_on_toaster1_button_pressed.bind(button))
			print("texture button")
	
	toasterBar.connect("loading_finished", Callable(self, "_on_loading_finished"))

func _on_toaster1_button_pressed(button: TextureButton):
	locked = true
	print("Button pressed, showing bar...")
	toasterBar.show_bar()
	closeToaster1()

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
