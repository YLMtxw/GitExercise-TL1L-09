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


func _ready():
	inventory.close()
	Imenu.closeMenu1()
	Imenu2.closeMenu2()
	Irefri.closeRefri()
	Istove1.closeStove1()
	Itoaster1.closeToaster1()
	Itoaster2.closeToaster2()
	paycheckmenu.close_paycheck()

func _process( delta ):
	if Input.is_action_just_pressed("OpenInv"):
		if inventory.InvOpen:
			inventory.close()
		else:
			inventory.open()
	

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


func _on_close_button_pressed() -> void:
	paycheckmenu.open_paycheck()
	pass # Replace with function body.
