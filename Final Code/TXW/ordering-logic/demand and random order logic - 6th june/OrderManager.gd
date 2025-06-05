extends Node

const MODIFICATION_CHANCE := 0.3

func generate_random_order() -> Dictionary:
	var dish_names = RecipeDatabase.recipes.keys()
	if dish_names.is_empty():
		push_error("No recipes found in RecipeDatabase.")
		return {}

	var chosen_dish = dish_names[randi() % dish_names.size()]
	var base_recipe = RecipeDatabase.get_base_recipe(chosen_dish)

	if base_recipe == null:
		push_error("Base recipe for '%s' not found." % chosen_dish)
		return {}

	var modified_recipe = base_recipe.duplicate()
	var modifications: Array = []

	# Attempt to modify recipe
	if randf() < MODIFICATION_CHANCE:
		var safe_items := []
		for item in modified_recipe:
			if item != "bun":  # Don't modify essential items
				safe_items.append(item)

		if not safe_items.is_empty():
			var chosen_item = safe_items[randi() % safe_items.size()]
			var do_remove = randi() % 2 == 0

			if do_remove:
				modified_recipe = modified_recipe.filter(func(i): return i != chosen_item)
				modifications.append("no " + chosen_item)
			else:
				modified_recipe.append(chosen_item)
				modifications.append("extra " + chosen_item)

	return {
		"name": chosen_dish,
		"recipe": modified_recipe,
		"modifications": modifications
	}
