extends Node2D

@onready var bin_node = $Bin

func _ready() -> void:
	if bin_node != null:
		bin_node.visible != Bin01.bin_visible 
	else:
		print("❌ 找不到 cactus_node，请检查路径是否正确")

func _process(_delta):
	bin_node.visible = Bin01.bin_visible
