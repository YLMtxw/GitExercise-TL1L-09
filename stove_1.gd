extends Control

var stove1 : bool = false
var is_menu_open : bool = false
var locked : bool = false
@onready var stoveBar = get_node("/root/Playground/CanvasLayer/loadingBar1")

func _ready() :
	for button in get_tree().get_nodes_in_group("stove1"):
		if button is TextureButton:
			button.pressed.connect(_on_stove1_button_pressed.bind(button))
			print("texture button")
	
	stoveBar.connect("loading_finished", Callable(self, "_on_loading_finished"))

func _on_stove1_button_pressed(button: TextureButton):
	locked = true
	print("Button pressed, showing bar...")
	stoveBar.show_bar()
	closeStove1()

func _on_loading_finished():
	if locked:
		locked = false
		print("Loading finished")

func _on_timer_timeout(button):
	print("Timer for ", button.name, "finished!")

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


func _on_vege_burger_pressed() -> void:
	pass # Replace with function body.


func _on_egg_pressed() -> void:
	pass # Replace with function body.


func _on_spaghetti_cooked_pressed() -> void:
	pass # Replace with function body.


func _on_aglio_olio_pressed() -> void:
	pass # Replace with function body.


func _on_carbo_pressed() -> void:
	pass # Replace with function body.


func _on_bolognese_pressed() -> void:
	pass # Replace with function body.


func _on_beef_cooked_pressed() -> void:
	pass # Replace with function body.


func _on_pattyb_cooked_pressed() -> void:
	pass # Replace with function body.


func _on_lamb_cooked_pressed() -> void:
	pass # Replace with function body.


func _on_pattyl_cooked_pressed() -> void:
	pass # Replace with function body.


func _on_chicken_cooked_pressed() -> void:
	pass # Replace with function body.


func _on_pattyc_cooked_pressed() -> void:
	pass # Replace with function body.


func _on_beef_steak_pressed() -> void:
	pass # Replace with function body.


func _on_beef_burger_pressed() -> void:
	pass # Replace with function body.


func _on_lamb_pressed() -> void:
	pass # Replace with function body.


func _on_lamb_burger_pressed() -> void:
	pass # Replace with function body.


func _on_chicken_pressed() -> void:
	pass # Replace with function body.


func _on_chicken_burger_pressed() -> void:
	pass # Replace with function body.
