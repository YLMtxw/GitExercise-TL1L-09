class_name InvOpenClose extends Control

var InvOpen: bool = false
@onready var pInventory : Inventory = preload("res://Inventory/playerInventory.tres")
@onready var slot : Array = $NinePatchRect/GridContainer.get_children()
@onready var refri = get_node("/root/Playground/CanvasLayer/refri")

var selected_index := -1

func _ready():
	pInventory.updated.connect(update)
	update()

func update():
	var item_count = pInventory.slots.size()
	var slot_count = slot.size()
	var count = min(item_count, slot_count)
	
	for i in range(count):
		slot[i].update(pInventory.slots[i])
	
func _unhandled_input(event):
	if event is InputEventKey and event.pressed and not event.echo:
		var index := -1
		match event.keycode:
			KEY_1 : index = 0
			KEY_2 : index = 1
			KEY_3 : index = 2
			KEY_4 : index = 3
			KEY_5 : index = 4
			KEY_6 : index = 5
			KEY_7 : index = 6
		if index != -1:
			select_slot(index)
			pass
		pass
	pass

func select_slot(index : int):
	if index < slot.size():
		for i in range(slot.size()):
			slot[i].item_selected(i == index)
		
		selected_index = index
		var selected_slot = slot[index]
		var item = selected_slot.InvSlot.item
		if item:
			print("Selected item:", item.name)
		else:
			print("Selected empty slot", index + 1)

func open():
	visible = true
	InvOpen = true

func close():
	visible = false
	InvOpen = false
