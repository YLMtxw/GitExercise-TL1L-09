class_name InvOpenClose extends Control

var InvOpen: bool = false
@onready var pInventory : Inventory = preload("res://Inventory/playerInventory.tres")
@onready var slot : Array = $NinePatchRect/GridContainer.get_children()

func _ready():
	update()

func update():
	var item_count = pInventory.items.size()
	var slot_count = slot.size()
	var count = min(item_count, slot_count)
	
	for i in range(count):
		slot[i].update(pInventory.items[i])

func open():
	visible = true
	InvOpen = true

func close():
	visible = false
	InvOpen = false
