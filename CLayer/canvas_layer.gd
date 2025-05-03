extends CanvasLayer

@onready var inventory = $InventoryGUI
@onready var Imenu = $menu
@onready var player = get_node("/root/Playground/Player_character")

func _ready():
	inventory.close()
	Imenu.closeMenu1()

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
	pass
