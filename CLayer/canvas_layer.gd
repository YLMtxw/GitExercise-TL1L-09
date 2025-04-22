extends CanvasLayer

@onready var inventory = $InventoryGUI

func _ready():
	inventory.close()

func _process( delta ):
	if Input.is_action_just_pressed("OpenInv"):
		if inventory.InvOpen:
			inventory.close()
		else:
			inventory.open()
