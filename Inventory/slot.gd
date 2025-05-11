extends Panel

@onready var backgroundS : Sprite2D = $background
@onready var itemS : Sprite2D = $CenterContainer/Panel/item

func update(item: InventoryItem):
	var itemS = get_node("CenterContainer/Panel/item") as Sprite2D
	if item == null:
		itemS.visible = false
	else:
		itemS.visible = true
		itemS.texture = item.texture
		resize_inventory_item(itemS, Vector2(30, 30))

func resize_inventory_item(sprite: Sprite2D, target_size: Vector2):
	if sprite.texture == null:
		return
		
	var texture_size = sprite.texture.get_size()
	var scale_factor = target_size / texture_size
	var final_scale = Vector2(min(scale_factor.x, scale_factor.y),min(scale_factor.x, scale_factor.y))
	sprite.scale = final_scale
	
