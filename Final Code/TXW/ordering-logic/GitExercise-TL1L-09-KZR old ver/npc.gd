extends CharacterBody2D

var order: String = ""
@onready var label = $Label

func _ready():
	randomize()
	var possible_orders = [
		"spaghetti cooked", "egg", "vege burger",
		"beef burger", "chicken burger", "lamb burger",
		"aglio olio", "carbonara", "bolognese",
		"meat beef", "meat chicken", "meat lamb"
	]
	order = possible_orders.pick_random()
	label.text = "Order: " + order
