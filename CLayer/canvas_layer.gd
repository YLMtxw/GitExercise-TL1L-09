extends CanvasLayer

@onready var inventory = $InventoryGUI
@onready var Imenu = $menu
@onready var Imenu2 = $menu2
@onready var Irefri = $refri
@onready var player = get_node("/root/Playground/Player_character")


func _ready():
	inventory.close()
	Imenu.closeMenu1()
	Imenu2.closeMenu2()
	Irefri.closeRefri()

func _process( delta ):
	if Input.is_action_just_pressed("OpenInv"):
		if inventory.InvOpen:
			inventory.close()
		else:
			inventory.open()
	


func _input(event):
	if Input.is_action_just_pressed("interact"):
		if player.is_near() == "knive" and player.is_on() == "1":
			if Imenu.menu:
				Imenu.closeMenu1()
			else:
				Imenu.openMenu1()
		elif player.is_near() == "knive" and player.is_on() == "2":
			if Imenu2.menu2:
				Imenu2.closeMenu2()
			else:
				Imenu2.openMenu2()
		elif player.is_near() == "refri":
			if Irefri.refri:
				Irefri.closeRefri()
			else:
				Irefri.openRefri()
		
	pass
