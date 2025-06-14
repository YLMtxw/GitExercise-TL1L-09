extends Node2D

@onready var vvip_node = $"VVIP carpet"

func _ready() -> void:
	if vvip_node != null:
		vvip_node.visible != Vvip.vvip_visible
	else:
		print("❌ 找不到 cactus_node，请检查路径是否正确")

func _process(_delta):
	vvip_node.visible = Vvip.vvip_visible
