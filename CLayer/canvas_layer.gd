extends CanvasLayer

@onready var inventory = $InventoryGUI
@onready var Imenu = $menu
@onready var Imenu2 = $menu2
@onready var Irefri = $refri
@onready var Istove1 = $stove1
@onready var Istove2 = $stove2
@onready var Itoaster1 = $toaster1
@onready var Itoaster2 = $toaster2
@onready var player = get_node("/root/Playground/Player_character")
@onready var paycheckmenu = $paycheck
@onready var income = $"paycheck/paycheckmenu/Income label/Income"
@onready var overlay = $overlay
@onready var UM = preload("res://updatemenu.tscn")
@onready var setting = $Setting


func _ready():
	inventory.close()
	Imenu.closeMenu1()
	Imenu2.closeMenu2()
	Irefri.closeRefri()
	Istove1.closeStove1()
	Itoaster1.closeToaster1()
	Itoaster2.closeToaster2()
	paycheckmenu.close_paycheck()
	setting.close_setting()

func _process( delta ):
	if Input.is_action_just_pressed("OpenInv"):
		if inventory.InvOpen:
			inventory.close()
		else:
			inventory.open()
	elif Input.is_action_just_pressed("quit"):
		print("esc pressed")
		if setting.setting_visibility:
			setting.close_setting()
		else:
			setting.open_setting()

func _input(event):
	if Input.is_action_just_pressed("interact"):
		if player.is_near() == "knive" and (player.is_on() == "1" or player.is_on() == "3"):
			if Imenu.menu:
				Imenu.closeMenu1()
			else:
				Imenu.openMenu1()
		elif player.is_near() == "knive" and (player.is_on() == "2" or player.is_on() == "4"):
			if Imenu2.menu2:
				Imenu2.closeMenu2()
			else:
				Imenu2.openMenu2()
		elif player.is_near() == "refri":
			if Irefri.refri:
				Irefri.closeRefri()
			else:
				Irefri.openRefri()
		elif player.is_near() == "stove" and (player.is_on() == "3" or player.is_on() == "1"):
			if Istove1.stove1:
				Istove1.closeStove1()
			else:
				Istove1.openStove1()
		elif player.is_near() == "stove" and (player.is_on() == "4" or player.is_on() == "2"):
			if Istove2.stove2:
				Istove2.closeStove2()
			else:
				Istove2.openStove2()
		elif player.is_near() == "bm" and (player.is_on() == "1" or player.is_on() == "3"):
			if Itoaster1.toaster1:
				Itoaster1.closeToaster1()
			else:
				Itoaster1.openToaster1()
		elif player.is_near() == "bm" and (player.is_on() == "2" or player.is_on() == "4"):
			if Itoaster2.toaster2:
				Itoaster2.closeToaster2()
			else:
				Itoaster2.openToaster2()

func set_pause_mode_recursive(node: Node, mode: int) -> void:
	if "process_mode" in node:
		node.process_mode = mode
	for child in node.get_children():
		if child is Node:
			set_pause_mode_recursive(child, mode)

func _on_close_button_pressed() -> void:
	paycheckmenu.open_paycheck()
	overlay.visible = true
	get_tree().paused = true
	
	set_pause_mode_recursive(paycheckmenu, Node.PROCESS_MODE_ALWAYS)

func _on_next_pressed() -> void:
	income.reset()
	paycheckmenu.close_paycheck()
	overlay.visible = false
	get_tree().paused = false
	get_tree().change_scene_to_file("res://updatemenu.tscn")
	pass # Replace with function body.
