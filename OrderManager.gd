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
	var display_name = recipe_name # e.g. "beef burger (no cheese)"

	# === Modification list
	var modifiables = ["cheese", "vegetable (peeled)", "tomato (sliced)", "mayonaise"]
	for mod in modifiables:
		# Only decide a mod if it appears at least once in the recipe
		if mod in base_ingredients:
			var mod_type = randi() % 3 # 0 = normal, 1 = no <ingredient>, 2 = extra <ingredient>
			if mod_type == 1:
				# Remove ALL occurrences of mod from the list
				while mod in base_ingredients:
					base_ingredients.erase(mod)
				modifications.append("no " + mod)
			elif mod_type == 2:
				# Add ONE more of this ingredient
				base_ingredients.append(mod)
				modifications.append("extra " + mod)
			# else normal: do nothing


	# Compose a display name if there are modifications
	if modifications.size() > 0:
		display_name += " (" + ", ".join(modifications) + ")"

	# Register this modified recipe for the cooking station
	if modifications.size() > 0:
		RecipeDatabase.recipes[display_name] = base_ingredients.duplicate()

	var order = {
		"name": display_name,
		"base_name": recipe_name,
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
	return result
