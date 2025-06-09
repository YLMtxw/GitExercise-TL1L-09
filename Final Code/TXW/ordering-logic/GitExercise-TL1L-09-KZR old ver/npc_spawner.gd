extends Node2D

@onready var spawn_point = $spawn_point
var npc_scene = preload("res://NPC.tscn")

func spawn_npc():
	var npc = npc_scene.instantiate()
	npc.global_position = spawn_point.global_position
	get_parent().add_child(npc)
