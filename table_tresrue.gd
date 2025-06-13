extends Node2D

@onready var tt_node = $"table tresure"

func _ready() -> void:
	if tt_node != null:
		tt_node.visible != Tt01.tt_visible
	else:
		print("❌ 找不到 cactus_node，请检查路径是否正确")

func _process(_delta):
	tt_node.visible = Tt01.tt_visible
