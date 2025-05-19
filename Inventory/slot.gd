extends Panel

@onready var backgroundS : Sprite2D = $background
@onready var itemS : Sprite2D = $CenterContainer/Panel/item
@onready var numLabel : Label = $CenterContainer/Panel/Label
@export var InvSlot : iSlot

func update(slot: iSlot):
	var itemS = get_node("CenterContainer/Panel/item") as Sprite2D
	if not slot.item:
		itemS.visible = false
		numLabel.visible = false
	else:
		itemS.visible = true
		itemS.texture = slot.item.texture
		resize_inventory_item(itemS, Vector2(30, 30))
		
		if slot.itemNum >= 2:
			numLabel.visible = true
			numLabel.text = str(slot.itemNum)
		else:
			numLabel.visible = false

func resize_inventory_item(sprite: Sprite2D, target_size: Vector2):
	if sprite.texture == null:
		return
		
	var texture_size = sprite.texture.get_size()
	var scale_factor = target_size / texture_size
	var final_scale = Vector2(min(scale_factor.x, scale_factor.y),min(scale_factor.x, scale_factor.y))
	sprite.scale = final_scale
	
