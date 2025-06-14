extends Node2D

@onready var bgm = $AudioStreamPlayer
var last_saved_position := Vector2.ZERO
@onready var aglio : InventoryItem = preload("res://Inventory/Item/aglio olio.tres")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.load_game(Global.current_store_name)
	#test function
	print("Aglio Price after load:", aglio.price)
	
	bgm.play()
	
	if Global.upgrade.get("count19", 0) >= 1:
		Cactus.is_visible = true
	
	if Global.upgrade.get("count20", 0) >= 1:
		Frame01.frame_visible = true
	
	if Global.upgrade.get("count21", 0) >= 1:
		Pot01.pot_visible = true
	
	if Global.upgrade.get("count22", 0) >= 1:
		Bin01.bin_visible  = true
	
	if Global.upgrade.get("count23", 0) >= 1:
		Signboard01.signboard_visible = true
	
	if Global.upgrade.get("count24", 0) >= 1:
		Td01.td_visible = true
	
	if Global.upgrade.get("count25", 0) >= 1:
		Tt01.tt_visible = true
	
	if Global.upgrade.get("count26", 0) >= 1:
		Vvip.vvip_visible = true
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
