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
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
