extends Node

var volume_db: float = 0.0
var money: int = 0
var position: Vector2 = Vector2(120, 150)
var upgrade = {
	"count1": 0,
	"count2": 0,
	"count3": 0,
	"count4": 0,
	"count5": 0,
	"count6": 0,
	"count7": 0,
	"count8": 0,
	"count9": 0,
	"count10": 0,
	"count11": 0,
	"count12": 0,
	"count13": 0,
	"count14": 0,
	"count15": 0,
	"count16": 0,
	"count17": 0,
	"count18": 0,
}
var current_store_name: String = ""

func save() -> Dictionary:
	return {
		"volume_db": volume_db,
		"money": money,
		"position": { "x": position.x, "y": position.y },
		"upgrade": upgrade
	}

func save_game(store_name: String):
	var file_path = "user://%s.json" % store_name
	var file = FileAccess.open(file_path, FileAccess.WRITE)
	if file:
		var json_string = JSON.stringify(save(), "\t")
		file.store_string(json_string)
		file.close()
		print(" Game data saved to: %s" % file_path)
	else:
		print(" Failed to save game for store: ", store_name)

func load_game(store_name: String):
	var file_path = "user://%s.json" % store_name
	if not FileAccess.file_exists(file_path):
		print(" Save file not found: ", file_path)
		return
	
	var file = FileAccess.open(file_path, FileAccess.READ)
	var text = file.get_as_text()
	var data = JSON.parse_string(text)
	
	if typeof(data) == TYPE_DICTIONARY:
		volume_db = data.get("volume_db", 0.0)
		money = data.get("money", 0)
		var pos_data = data.get("position", {"x": 0, "y": 0})
		position = Vector2(pos_data["x"], pos_data["y"])  
		upgrade = data.get("upgrade", {})
		print(" Loaded data: ", data)
	else:
		print(" Failed to parse JSON data.")
