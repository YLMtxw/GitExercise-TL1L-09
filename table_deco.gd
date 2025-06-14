extends Node2D

@onready var td_node = $"table deco"

func _ready() -> void:
	if td_node != null:
		td_node.visible != Td01.td_visible
	else:
		print("❌ 找不到 cactus_node，请检查路径是否正确")

func _process(_delta):
	td_node.visible = Td01.td_visible
