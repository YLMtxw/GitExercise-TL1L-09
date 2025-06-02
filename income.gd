extends HBoxContainer

@onready var money_label: Label = $Money

var money: int = 0

func add_money(amount: int) -> void:
	money += amount
	money_label.text = str(money)

func reset() -> void:
	money = 0
	money_label.text = str(money)
