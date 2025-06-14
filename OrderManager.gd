extends Node

var current_npc: Node = null
var current_order_data: Dictionary = {}
var valid_dishes = [
	"vege burger",
	"beef burger",
	"chicken burger",
	"lamb burger",
	"carbonara",
	"bolognese",
	"aglio olio",
	"grilled beef steak",
	"grilled chicken steak",
	"grilled lamb steak",
	"egg mayo sandwich",
	"chicken sandwich",
	"lamb sandwich",
	"beef sandwich",
	"vege sandwich",
	"coke",
	"100plus",
	"sprite",
	"7up"
]

func generate_random_order():
	var keys = valid_dishes
	var recipe_name = keys[randi() % keys.size()]
	var base_ingredients = RecipeDatabase.recipes[recipe_name].duplicate()
	var modifications = []

	# === Modification list
	var modifiables = ["cheese", "sliced vege", "sliced tomato", "mayonaise"]
	for mod in modifiables:
		if mod in base_ingredients:
			var mod_type = randi() % 3 # 0 = normal, 1 = no <ingredient>, 2 = extra <ingredient>
			if mod_type == 1:
				base_ingredients.erase(mod)
				modifications.append("no " + mod)
			elif mod_type == 2:
				base_ingredients.append(mod)
				modifications.append("extra " + mod)
			# else normal: do nothing

	# Compose a display name if there are modifications
	var display_name = recipe_name
	if modifications.size() > 0:
		display_name += " (" + ", ".join(modifications) + ")"

	# Register this modified recipe for the cooking station to see
	RecipeDatabase.recipes[display_name] = base_ingredients.duplicate()

	var order = {
		"name": display_name,
		"ingredients": base_ingredients,
		"modifications": modifications
	}
	return order

func set_current_order(npc: Node, order: Dictionary):
	current_npc = npc
	current_order_data = order
	print("Current order set:", current_order_data)

func get_current_order() -> Dictionary:
	return current_order_data

func clear_order():
	current_npc = null
	current_order_data = {}

func format_order_text(order: Dictionary) -> String:
	var result = order.get("name", "???")
	var mods = order.get("modifications", [])
	if mods.size() > 0:
		result += " (" + ", ".join(mods) + ")"
	return result
