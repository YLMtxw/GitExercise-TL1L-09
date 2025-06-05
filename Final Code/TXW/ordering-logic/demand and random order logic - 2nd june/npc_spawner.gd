extends Node2D

@export var npc_scene: PackedScene
@export var spawn_position: Vector2 = Vector2(100, 100)
@onready var spawn_timer: Timer = $SpawnTimer

var assigned_seats := {}

func _ready():
	spawn_timer.timeout.connect(try_spawn_npcs)

func try_spawn_npcs():
	var seats = get_tree().get_nodes_in_group("seats")

	for seat in seats:
		# Only consider unoccupied and unassigned seats
		if not seat.occupied and not assigned_seats.has(seat):
			var npc = npc_scene.instantiate()
			npc.global_position = spawn_position
			npc.target_seat = seat
			get_tree().current_scene.add_child(npc)

			assigned_seats[seat] = true

			# Connect to npc_left to reassign seat when done
			npc.npc_left.connect(_on_npc_left)
			
			# Spawn only one NPC per timer tick
			return

func _on_npc_left(seat):
	assigned_seats.erase(seat)
