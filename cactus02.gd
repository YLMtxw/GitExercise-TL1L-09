extends Node2D

@onready var cactus_node = $cactus

func _ready() -> void:
	if cactus_node != null:
		cactus_node.visible != Cactus.is_visible
	else:
		print("❌ 找不到 cactus_node，请检查路径是否正确")

func _process(_delta):
	cactus_node.visible = Cactus.is_visible
	if Cactus.is_visible == false:
		$cactus/CollisionShape2D.disabled = true
