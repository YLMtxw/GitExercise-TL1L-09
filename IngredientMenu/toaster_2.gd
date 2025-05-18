extends Control

var toaster2 : bool = false
var is_menu_open : bool = false
var locked : bool = false
@onready var toasterBar2 = get_node("/root/Playground/CanvasLayer/loadingBar4")

func _ready() :
	for button in get_tree().get_nodes_in_group("toaster2"):
		if button is TextureButton:
			button.pressed.connect(_on_toaster2_button_pressed.bind(button))
			print("texture button")
	
	toasterBar2.connect("loading_finished", Callable(self, "_on_loading_finished"))

func _on_toaster2_button_pressed(button: TextureButton):
	locked = true
	print("Button pressed, showing bar...")
	toasterBar2.show_bar()
	closeToaster2()

func _on_loading_finished():
	if locked:
		locked = false
		print("Loading finished")

func _on_timer_timeout(button):
	print("Timer for ", button.name, "finished!")

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
	pass # Replace with function body.


func _on_egg_mayo_sandwich_pressed() -> void:
	pass # Replace with function body.


func _on_chic_sandwich_pressed() -> void:
	pass # Replace with function body.


func _on_lamb_sandwich_pressed() -> void:
	pass # Replace with function body.


func _on_beef_sandwich_pressed() -> void:
	pass # Replace with function body.
