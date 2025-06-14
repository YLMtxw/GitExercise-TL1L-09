extends Node2D

@onready var signboard_node = $"signboard"

func _ready() -> void:
	if signboard_node != null:
		signboard_node.visible != Signboard01.signboard_visible
	else:
		print("❌ 找不到 cactus_node，请检查路径是否正确")

func _process(_delta):
	signboard_node.visible = Signboard01.signboard_visible
	if Signboard01.signboard_visible == false:
		$signboard/CollisionShape2D.disabled = true
