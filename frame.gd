extends Node2D

@onready var frame_node = $"Frame"

func _ready() -> void:
	if frame_node != null:
		frame_node.visible != Frame01.frame_visible
	else:
		print("❌ 找不到 cactus_node，请检查路径是否正确")

func _process(_delta):
	frame_node.visible = Frame01.frame_visible
