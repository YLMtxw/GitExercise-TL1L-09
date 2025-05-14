class_name Inventory extends Resource

@export var items : Array[InventoryItem]

func add_item(item: InventoryItem) -> void:
	items.append(item)
	print("added item ", item.name)
