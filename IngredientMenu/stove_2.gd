extends Control

var stove2 : bool = false
var is_menu_open : bool = false
var locked : bool = false
@onready var stoveBar2 = get_node("/root/Playground/CanvasLayer/loadingBar2")

func _ready() :
	for button in get_tree().get_nodes_in_group("stove2"):
		if button is TextureButton:
			button.pressed.connect(_on_stove2_button_pressed.bind(button))
			print("texture button")
	
	stoveBar2.connect("loading_finished", Callable(self, "_on_loading_finished"))

func _on_stove2_button_pressed(button: TextureButton):
	locked = true
	print("Button pressed, showing bar...")
	stoveBar2.show_bar()
	closeStove2()

func _on_loading_finished():
	if locked:
		locked = false
		print("Loading finished")

func _on_timer_timeout(button):
	print("Timer for ", button.name, "finished!")

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
