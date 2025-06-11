extends HBoxContainer

@onready var money_label: Label = $Money

var money: int = 0

func add_money(amount: int) -> void:
	money += amount
	money_label.text = str(money)

func reset() -> void:
	money = 0
	money_label.text = str(money)

func save_player_data():
	var player_data = PlayerData.new()
	var income_amount = int(money_label.text)  # ✅ 获取金币数
	player_data.money = money_label
	var json_data = JsonClassConverter.class_to_json(player_data)
	var file = FileAccess.open("res://DATA/Hello.json", FileAccess.WRITE)
	file.store_string(JSON.stringify(json_data))
	file.close()
	
	# 确保目录存在
	var dir_path = "res://DATA"
	if not DirAccess.dir_exists_absolute(dir_path):
		DirAccess.make_dir_recursive_absolute(dir_path)

	file.store_string(JSON.stringify(json_data))
	file.close()
