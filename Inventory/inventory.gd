class_name Inventory extends Resource

@export var slots : Array[iSlot]

signal updated

func add_item(item: InventoryItem) -> void:
	var slotHaveItem = slots.filter(func(slot): return slot.item == item)
	if not slotHaveItem.is_empty():
		slotHaveItem[0].itemNum += 1
	else:
		var slotIsEmpty = slots.filter(func(slot): return slot.item == null)
		if not slotIsEmpty.is_empty():
			slotIsEmpty[0].item = item
			slotIsEmpty[0].itemNum = 1
	updated.emit()
	
func remove_item(item: InventoryItem, amount: int = 1):
	for slot in slots:
		if slot.item == item:
			slot.itemNum -= amount
			if slot.itemNum <= 0:
				slot.item = null
				slot.itemNum = 0
			updated.emit()
			return
