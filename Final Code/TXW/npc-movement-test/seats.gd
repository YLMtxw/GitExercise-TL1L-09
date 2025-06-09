extends Node2D

var occupied := false

func _on_OccupyArea_body_entered(body):
	if body is CharacterBody2D:
		occupied = true
