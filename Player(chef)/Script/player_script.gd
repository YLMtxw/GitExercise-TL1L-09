extends CharacterBody2D

const  movement_speed : int = 150
const run_speed : int = 225
#vector2 contain 2 num, x and y
var direction : Vector2 = Vector2.ZERO
var store_direction : Vector2 = Vector2.DOWN
var npc_at_counter: bool = false
var npc_node_at_counter: Node = null
@onready var animation = $AnimationPlayer
@onready var tilemap = get_node("../TileMapLayer3")
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
@onready var paycheckmenu = get_node("/root/Playground/CanvasLayer/paycheck/paycheckmenu/total label/Total")
@onready var income = get_node("/root/Playground/CanvasLayer/paycheck/paycheckmenu/Income label/Income")
@onready var setting = get_node("/root/Playground/CanvasLayer/Setting")

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
const COUNTER_POSITION1 = Vector2i(9,14)
const COUNTER_POSITION2 = Vector2i(10,14)
const source3 =3
const npc_pos = Vector2i(4,8)
var last_saved_position := Vector2.ZERO
func _ready():
	global_position = Global.position
	var npcs = get_tree().get_nodes_in_group("npcs")
	for npc in npcs:
		npc.connect("at_counter", Callable(self, "_on_npc_at_counter").bind(npc))
		npc.connect("left_counter", Callable(self, "_on_npc_left_counter").bind(npc))
		npc.connect("order_accepted", Callable(self, "_on_npc_order_accepted"))
		
func is_near_counter() -> bool:
	var current_tile = tilemap.local_to_map(global_position)
	return current_tile == COUNTER_POSITION1 or current_tile == COUNTER_POSITION2

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
		
	var allowed_tiles = [
		Vector2i(5, 43),
		Vector2i(6, 43)
	]
	var near = is_near()
	var near2 = allowed_tiles
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
			
	if event.is_action_pressed("interact"):
		var current_tile = tilemap.local_to_map(global_position)
		if (current_tile == COUNTER_POSITION1 or current_tile == COUNTER_POSITION2) and npc_at_counter and npc_node_at_counter:
			var held_item = get_selected_inventory_item()
			if held_item != "":
				# Check if the held item matches the NPC's order
				var current_order = OrderManager.get_current_order()
				if current_order and held_item == current_order["name"]:
					# Get the item's price from the inventory
					var inv = get_node("/root/Playground/CanvasLayer/InventoryGUI")
					if inv and inv is InvOpenClose:
						if inv.selected_index >= 0 and inv.selected_index < inventory.slots.size():
							var slot = inventory.slots[inv.selected_index]
							if slot.item:
								var item_price = slot.item.price
								var money_display = get_node("/root/Playground/CanvasLayer/MoneyLabel")
								money_display.add_money(item_price)
								paycheckmenu.add_money(item_price)
								income.add_money(item_price)
								Global.money += item_price
								
								inventory.remove_item(slot.item, 1)
								npc_node_at_counter.receive_served_item(held_item)
								inv.update()
								return
				# If we get here, the item didn't match the order
					print("That's not what the customer ordered!")
				else:
					print("You are not holding any food!")

func _on_npc_at_counter(npc):
	npc_at_counter = true
	npc_node_at_counter = npc

func _on_npc_left_counter(npc):
	if npc_node_at_counter == npc:
		npc_at_counter = false
		npc_node_at_counter = null

func is_on_interact_tile() -> bool:
	var allowed_tiles = [
		Vector2i(5, 43),
		Vector2i(6, 43)
	]
	var player_tile = tilemap.local_to_map(global_position)
	return player_tile in allowed_tiles
	
func _on_npc_order_accepted(dish_name):
	var inv = get_node("/root/Playground/CanvasLayer/InventoryGUI")
	var money_display = get_node("/root/Playground/CanvasLayer/MoneyLabel")
	var paycheckmenu = get_node("/root/Playground/CanvasLayer/paycheck/paycheckmenu/total label/Total")
	var income = get_node("/root/Playground/CanvasLayer/paycheck/paycheckmenu/Income label/Income")

	if inv and inv is InvOpenClose:
		for slot in inv.slots:
			if slot.item and slot.item.name == dish_name and slot.itemNum > 0:
				var item = slot.item
				var item_price = item.price

				# Add money immediately
				Global.money += item_price
				money_display.add_money(item_price)
				paycheckmenu.add_money(item_price)
				income.add_money(item_price)
				print("Sold:", item.name, "for $", item_price)
				
				inventory.remove_item(slot.item, 1)
				print("Removed served item from inventory:", dish_name)
				
				return
				
func get_selected_inventory_item():
	var inv = get_node("/root/Playground/CanvasLayer/InventoryGUI")
	if inv and inv is InvOpenClose:
		if inv.selected_index >= 0 and inv.selected_index < inventory.slots.size():
			var slot = inventory.slots[inv.selected_index]
			if slot.item:
				return slot.item.name
	return ""
