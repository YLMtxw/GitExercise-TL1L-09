extends Node2D

@onready var pot_node = $pot

func _ready() -> void:
	if pot_node != null:
		pot_node.visible != Pot01.pot_visible
	else:
		print("❌ 找不到 cactus_node，请检查路径是否正确")

func _process(_delta):
	pot_node.visible = Pot01.pot_visible
