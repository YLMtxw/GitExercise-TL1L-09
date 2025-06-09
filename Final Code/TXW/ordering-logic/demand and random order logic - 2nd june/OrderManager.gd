extends Node

var recipes := {
	"Chicken Sandwich": ["bun", "chicken patty", "lettuce", "cheese"],
	"Egg Sandwich": ["bun", "egg", "lettuce", "cheese"],
	"Lamb Sandwich": ["bun", "lamb patty", "lettuce", "cheese"]
}

func generate_order() -> Dictionary:
	var food_names = recipes.keys()
	var base_name = food_names[randi() % food_names.size()]
	var base_ingredients = recipes[base_name].duplicate()
	var modified_ingredients = base_ingredients.duplicate()
	var modified_name = base_name

	var modification_chance = randf()
	if modification_chance <= 0.3:
		# Only attempt to modify cheese
		if "cheese" in base_ingredients:
			var choice = randi() % 2
			if choice == 0:
				# No cheese
				modified_ingredients.erase("cheese")
				modified_name += " (no cheese)"
			else:
				# Extra cheese
				modified_ingredients.append("cheese")
				modified_name += " (extra cheese)"
	
	return {
		"name": modified_name,
		"ingredients": modified_ingredients
	}
