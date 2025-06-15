extends Control

@onready var menu = get_node("../Menu")
@onready var menu2 = get_node("../Menu2")

func _ready():
	print("menu: ", menu)
	print("menu2: ", menu2)

func _input(event):
	if event is InputEventKey and event.pressed and event.keycode == KEY_ESCAPE:
		get_tree().quit()

func _on_texture_button_pressed() -> void:
	$ClickSound.play()
	if menu2: menu2.visible = true
	if menu: menu.visible = false

func _on_texture_button_2_pressed() -> void:
	$ClickSound.play()
	visible = false

func _on_texture_button_3_pressed() -> void:
	visible = false

func _on_texture_button_4_pressed() -> void:
	if menu2: menu2.visible = false
	if menu: menu.visible = true
