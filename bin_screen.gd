extends Node2D

@onready var collision = $Bin/CollisionShape2D

func _ready() -> void:
	if collision != null:
		collision.visible = Bin01.bin_visible 
	else:
		print("❌ 找不到 cactus_node，请检查路径是否正确")
