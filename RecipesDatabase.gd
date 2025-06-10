extends Node

var recipes = {
	"Chicken Burger": ["bun", "chicken patty", "lettuce", "cheese", "bun"],
	"Veggie Sandwich": ["bun", "lettuce", "tomato", "cheese", "bun"],
	"Egg Mayo": ["bun", "egg", "mayo", "lettuce", "bun"]
}

func get_base_recipe(dish_name: String) -> Array:
	return recipes.get(dish_name, []).duplicate()
