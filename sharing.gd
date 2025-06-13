extends Node

func _ready() -> void:
	var scene_a = preload("res://updatemenu.tscn").instantiate()
	var scene_b = preload("res://playground.tscn").instantiate()

	# 获取 scene_b 中你要控制的节点，比如叫 TargetSprite
	var target = scene_b.get_node("cactus")  # ⚠️ 改成真实路径

	# 把它传进 scene_a 的变量
	scene_a.target_node = target

	# 加载到主场景中
	add_child(scene_b)
	add_child(scene_a)
