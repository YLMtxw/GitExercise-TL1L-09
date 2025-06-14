extends Node2D

@export var npc_scene: PackedScene
@onready var spawn_timer: Timer = $SpawnTimer
@onready var counter_marker: Marker2D = $CounterPoint
@onready var spawn_marker: Marker2D = $SpawnPoint
@onready var order_manager = $OrderManager  # Adjust path if needed
@onready var player: CharacterBody2D = $"../../Player_character"

var assigned_seats := {}
var waiting_npc: CharacterBody2D = null
var can_spawn := true

func _ready():
	spawn_timer.timeout.connect(try_spawn_npc)
	spawn_timer.start()

func try_spawn_npc():
	if not can_spawn:
		return

	var seats = get_tree().get_nodes_in_group("seats")

	for seat in seats:
		if not seat.occupied and not assigned_seats.has(seat):
			# Instantiate NPC
			if npc_scene == null:
				push_error("npc_scene is not set!")
				return

			var npc = npc_scene.instantiate()
			npc.global_position = spawn_marker.global_position
			npc.counter_position = counter_marker.global_position
			npc.target_seat = seat

			# Generate random order
			var order = OrderManager.generate_random_order()
			npc.order_data = order

			# Track assigned seat
			assigned_seats[seat] = true
			waiting_npc = npc
			can_spawn = false

			# Connect signals for spawner logic
			npc.npc_left.connect(_on_npc_left)
			npc.started_moving_to_seat.connect(_on_npc_started_moving)

			# Connect signals for PLAYER logic (so player gets notified)
			npc.at_counter.connect(player._on_npc_at_counter.bind(npc))
			npc.left_counter.connect(player._on_npc_left_counter.bind(npc))

			get_tree().current_scene.add_child(npc)
			return

func _process(_delta):
	pass

func _on_npc_started_moving():
	waiting_npc = null
	can_spawn = true
	spawn_timer.start()

func _on_npc_left(seat):
	assigned_seats.erase(seat)


func _on_counter_area_body_entered(body: Node2D) -> void:
	pass # Replace with function body.


func _on_counter_area_body_exited(body: Node2D) -> void:
	pass # Replace with function body.
