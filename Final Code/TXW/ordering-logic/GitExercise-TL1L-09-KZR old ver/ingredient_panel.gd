extends Panel

@onready var npc_spawner = $"../NPCSpawner"

func _on_EggButton_pressed():
	npc_spawner.served_order = "egg"

func _on_ChickenButton_pressed():
	npc_spawner.served_order = "chicken"

func _on_SpaghettiCookedButton_pressed():
	npc_spawner.served_order = "spaghetti cooked"

func _on_LambButton_pressed():
	npc_spawner.served_order = "lamb"

func _on_VegeButton_pressed():
	npc_spawner.served_order = "vege"

func _on_BeefButton_pressed():
	npc_spawner.served_order = "beef"
