extends Label

func get_player_file_path(store_name: String) -> String:
	return "user://%s.json" % store_name

func load_player_data(store_name: String) -> Dictionary:
	var path = get_player_file_path(store_name)
	if FileAccess.file_exists(path):
		var file = FileAccess.open(path, FileAccess.READ)
		var text = file.get_as_text()
		file.close()
		var data = JSON.parse_string(text)
		if typeof(data) == TYPE_DICTIONARY:
			return data
	return {}  # 不存在或读取失败

func get_current_store_name() -> String:
	var path = "user://current_user.json"
	if FileAccess.file_exists(path):
		var file = FileAccess.open(path, FileAccess.READ)
		var text = file.get_as_text()
		file.close()
		var data = JSON.parse_string(text)
		if typeof(data) == TYPE_DICTIONARY and data.has("store_name"):
			return data["store_name"]
	return ""
	
func _ready():
	var store_name = get_current_store_name()
	if store_name != "":
		var data = load_player_data(store_name)
		if data.has("coins"):
			text = str(data["coins"])
		else:
			text = "0"
	else:
		text = "未登录店铺"
