extends CanvasLayer

@onready var inventory = $InventoryGUI
@onready var menu = $Menu
@onready var player = $player_character


func _ready():
	inventory.close()
	menu.closeMenu()

func _process( delta ):
	if Input.is_action_just_pressed("OpenInv"):
		if inventory.InvOpen:
			inventory.close()
		else:
			inventory.open()
			
func _input(event):
	if event.is_action_pressed("interact"): # e
		var near = player.is_near()
		if near == "knive":
			if menu.menu1:
				menu.closeMenu()
			else:
				menu.openMenu()
				print("knive")
