extends CharacterBody2D

const  movement_speed : int = 150
const run_speed : int = 225
#vector2 contain 2 num, x and y
var direction : Vector2 = Vector2.ZERO
var store_direction : Vector2 = Vector2.DOWN
@onready var animation = $AnimationPlayer
@onready var tilemap = $"../TileMapLayer3"
@onready var menuOpen = get_node("/root/Playground/CanvasLayer/menu")
@onready var menuOpen2 = get_node("/root/Playground/CanvasLayer/menu2")
@onready var refriOpen = get_node("/root/Playground/CanvasLayer/refri")
@onready var stoveOpen1 = get_node("/root/Playground/CanvasLayer/stove1")
@onready var stoveOpen2 = get_node("/root/Playground/CanvasLayer/stove2")
@onready var toasterOpen1 = get_node("/root/Playground/CanvasLayer/toaster1")
@onready var toasterOpen2 = get_node("/root/Playground/CanvasLayer/toaster2")
@onready var EPrompt = $InteractE
@onready var canvas = get_node("/root/Playground/CanvasLayer")
@export var inventory : Inventory
@export var slots : iSlot

const source = 0
const stove_coord1 = Vector2i(7,28)
const stove_coord2 = Vector2i(8,28)
const knive_source = 2
const knive_coord = Vector2i(13,7)
const source2 = 1
const knive_coord2 = Vector2i(3,2)
const refri_coord1 = Vector2i(0,16)
const refri_coord2 = Vector2i(1,16)
const bin_coord1 = Vector2i(11,31)
const bin_coord2 = Vector2i(11,30)
const bm_coord1 = Vector2i(0,6)
const bm_coord2 = Vector2i(1,6)
const bm_coord3 = Vector2i(13,31)
const k1_coord = Vector2i(13,39)
const k2_coord = Vector2i(14,40)
const k3_coord = Vector2i(13,40)
const k4_coord = Vector2i(14,39)

func _process(delta):
	if menuOpen.Mopen():
		return
	if menuOpen2.Mopen2():
		return
	if refriOpen.Ropen():
		return
	if stoveOpen1.S1open():
		return
	if stoveOpen2.S2open():
		return
	if toasterOpen1.t1open():
		return
	if toasterOpen2.t2open():
		return
	movement(delta)

func movement(delta):
	direction.x = Input.get_action_strength("Right") - Input.get_action_strength("Left")
	direction.y = Input.get_action_strength("Down") - Input.get_action_strength("Up")
	
	if direction != Vector2.ZERO:
		#to store player direction so when player is not moving, it will face to where its stop
		store_direction = direction
	
	var near = is_near()
	if near == "stove" or near == "refri" or near == "knive" or near == "bin" or near == "bm":
		$InteractE.showE()
		$InteractE.position = $InteractE.EP_pos  # <- This line is the key
	else:
		$InteractE.hideE()
		

func is_near() -> String:
	var offsets = [
		Vector2i(0, 0),
		Vector2i(0, 1),   
		Vector2i(0, -1),  
		Vector2i(1, 0),   
		Vector2i(-1, 0)
	]
	for offset in offsets:
		var cell = tilemap.local_to_map(global_position) + offset
		var source_id = tilemap.get_cell_source_id(cell)
		var coords = tilemap.get_cell_atlas_coords(cell)
		if source_id == source and (coords == stove_coord1 or coords == stove_coord2):
			return "stove"
		if (source_id == knive_source or source_id == source2) and (coords == knive_coord or coords == knive_coord2):
			return "knive"
		if source_id == source and (coords == refri_coord1 or coords == refri_coord2):
			return "refri"
		if source_id == source and (coords == bin_coord1 or coords == bin_coord2):
			return "bin"
		if (source_id == source or source_id == source2) and (coords == bm_coord1 or coords == bm_coord2 or coords == bm_coord3):
			return "bm"
	return ""

func is_on() -> String :
	var offset = Vector2i(0,0)
	var cell = tilemap.local_to_map(global_position) + offset
	var source_id = tilemap.get_cell_source_id(cell)
	var coords = tilemap.get_cell_atlas_coords(cell)
	if source_id == source and coords == k1_coord:
		return "1"
	if source_id == source and coords == k2_coord:
		return "2"
	if source_id == source and coords == k3_coord:
		return "3"
	if source_id == source and coords == k4_coord:
		return "4"
	return ""

func UpdateAction():
	var action = "walk_down"
	if store_direction.y < 0: action = "walk_up"
	elif store_direction.x > 0: 
		$Sprite2D.flip_h = false
		action = "walk_leftright"
	elif store_direction.x < 0: 
		$Sprite2D.flip_h = true
		action = "walk_leftright"
	
	if direction == Vector2.ZERO:
		animation.stop()
	else:
		animation.play(action)

func remove_selected_item():
	var inv = get_node("/root/Playground/CanvasLayer/InventoryGUI")
	if inv and inv is InvOpenClose:
		if inv.selected_index >= 0 and inv.selected_index < inventory.slots.size():
			var slot = inventory.slots[inv.selected_index]
			if slot.item:
				inventory.remove_item(slot.item, 1)
			else:
				print("No item in selected slot.")
		else:
			print("No valid slot selected.")
	else:
		print("Inventory UI not found or not loaded.")

func _physics_process( delta ):
	var current_speed = movement_speed
	if Input.is_key_pressed(KEY_SHIFT): 
		current_speed = run_speed
	velocity = direction * current_speed
	move_and_slide()
	UpdateAction()
	
func _input(event):
	if event.is_action_pressed("sell"):  # q
		var money_display = get_node("/root/Playground/CanvasLayer/MoneyLabel")
		money_display.add_money(10) 
	if event.is_action_pressed("upgrade"): # r
		var money_display = get_node("/root/Playground/CanvasLayer/MoneyLabel")
		money_display.upgrade(20)
	if event.is_action_pressed("interact"): # e
		var near = is_near()
		if is_near() == "stove":
			print("stove")
		if is_near() == "knive":
			print("knive")
		if is_near() == "refri":
			print("refri")
		if is_near() == "bin":
			remove_selected_item()
			print("bin")
		if is_near() == "bm":
			print("bm")
