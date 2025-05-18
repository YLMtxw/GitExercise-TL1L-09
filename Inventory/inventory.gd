class_name Inventory extends Resource

@export var items : Array[InventoryItem]

signal updated

func add_item(item: InventoryItem) -> void:
	for i in range (items.size()):
		if !items[i]:
			items[i] = item
			print("added item ", item.name)
			break
	updated.emit()
