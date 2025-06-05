extends Node2D

@onready var order_label = $OrderLabel
@onready var recipe_label = $RecipeLabel
@onready var button = $GenerateButton

var recipes = {
	"chicken burger": ["bun", "chicken patty", "lettuce", "cheese", "bun"],
	"egg mayo": ["bun", "egg", "mayo", "lettuce", "bun"],
	"vege": ["bun", "lettuce", "tomato", "cheese", "bun"]
}

var possible_mods = [
	{"type": "remove", "ingredient": "cheese"},
	{"type": "add", "ingredient": "cheese"},
	{"type": "remove", "ingredient": "lettuce"},
	{"type": "add", "ingredient": "lettuce"}
]

func _ready():
	button.pressed.connect(_on_generate_order)

func _on_generate_order():
	var final_recipe = []
	var chosen_name = recipes.keys().pick_random()
	final_recipe = recipes[chosen_name].duplicate()
	
	var display_name = chosen_name
	
	# 30% chance to modify
	if randf() < 0.3:
		var mod = possible_mods.pick_random()
		if mod.type == "remove" and final_recipe.has(mod.ingredient):
			final_recipe.erase(mod.ingredient)
			display_name += " (no " + mod.ingredient + ")"
		elif mod.type == "add":
			final_recipe.insert(final_recipe.size() - 1, mod.ingredient)
			display_name += " (extra " + mod.ingredient + ")"
	
	order_label.text = "Order: " + display_name
	recipe_label.text = "Required: " + str(final_recipe)
