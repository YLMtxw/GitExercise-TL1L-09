extends Node

var current_npc: Node = null
var current_order_data: Dictionary = {}

var base_recipes = {
	"Egg Mayo Sandwich": ["Bread", "Egg", "Mayo"],
	"Beef Sandwich": ["Bread", "Beef", "Cheese"]
}

func attempt_serve(served_name: String):
	if current_npc == null:
		print("❌ No NPC waiting!")
		return

	# Find matching recipe in your `recipes` map
	if not RecipeDatabase.has(served_name):
		print("❌ Unknown dish:", served_name)
		return

	var served_ingredients = RecipeDatabase[served_name]
	var expected_ingredients = current_order_data.get("ingredients", [])

	# 🔍 Sort both lists to make comparison easier
	served_ingredients.sort()
	expected_ingredients.sort()

	if served_ingredients == expected_ingredients:
		print("✅ Correct dish served!")
		current_npc.move_to_seat()
		current_npc = null
		current_order_data = {}
	else:
		print("❌ Wrong dish! Expected:", expected_ingredients, "but got:", served_ingredients)

func generate_random_order():
	var keys = base_recipes.keys()
	var recipe_name = keys[randi() % keys.size()]
	var base = base_recipes[recipe_name].duplicate()
	if randi() % 2 == 0:
		base.erase("Cheese")
	elif randi() % 2 == 0:
		base.append("Extra Cheese")

	return {
		"name": recipe_name,
		"ingredients": base
	}
	
func set_current_order(npc: Node, order: Dictionary):
	current_npc = npc
	current_order_data = order
	print("Current order set:", current_order_data)

func format_order_text(order: Dictionary) -> String:
	return order.name + ": " + ", ".join(order.ingredients)
