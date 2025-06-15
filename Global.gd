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
	"count19": 0,
	"count20": 0,
	"count21": 0,
	"count22": 0,
	"count23": 0,
	"count24": 0,
	"count25": 0,
	"count26": 0
	
}
var current_store_name: String = ""
#food price
@onready var aglio : InventoryItem = preload("res://Inventory/Item/aglio olio.tres")
@onready var beef_burger : InventoryItem = preload("res://Inventory/Item/beef burger.tres")
@onready var beef_sandwich : InventoryItem = preload("res://Inventory/Item/beef sandwich.tres")
@onready var bolognese : InventoryItem = preload("res://Inventory/Item/bolognese.tres")
@onready var carbonara : InventoryItem = preload("res://Inventory/Item/carbonara.tres")
@onready var chicken_burger : InventoryItem = preload("res://Inventory/Item/chicken burger.tres")
@onready var chicken_sandwich : InventoryItem = preload("res://Inventory/Item/chicken sandwich.tres")
@onready var egg_mayo_s : InventoryItem = preload("res://Inventory/Item/egg mayo sandwich.tres")
@onready var lamb_burger : InventoryItem = preload("res://Inventory/Item/lamb burger.tres")
@onready var lamb_sandwich : InventoryItem = preload("res://Inventory/Item/lamb sandwich.tres")
@onready var GBeefS : InventoryItem = preload("res://Inventory/Item/meat beef.tres")
@onready var GChickenS : InventoryItem = preload("res://Inventory/Item/meat chicken.tres")
@onready var GLambS : InventoryItem = preload("res://Inventory/Item/meat lamb.tres")
@onready var vege_burger : InventoryItem = preload("res://Inventory/Item/vege burger.tres")
@onready var vege_sandwich : InventoryItem = preload("res://Inventory/Item/vege burger.tres")

#drink price
@onready var sprite : InventoryItem = preload("res://Inventory/Item/7up.tres")
@onready var hplus : InventoryItem = preload("res://Inventory/Item/100plus.tres")
@onready var coco : InventoryItem = preload("res://Inventory/Item/coke.tres")
@onready var sparkling : InventoryItem = preload("res://Inventory/Item/sprite.tres")

func save() -> Dictionary:
	return {
		"volume_db": volume_db,
		"money": money,
		"upgrade": upgrade,
		"prices": {
			"aglio": aglio.price,
			"bolognese": bolognese.price,
			"carbonara": carbonara.price,
			"chicken_sandwich": chicken_sandwich.price,
			"lamb_sandwich": lamb_sandwich.price,
			"beef_sandwich": beef_sandwich.price,
			"vege_sandwich": vege_sandwich.price,
			"chicken_burger": chicken_burger.price,
			"lamb_burger": lamb_burger.price,
			"beef_burger": beef_burger.price,
			"vege_burger": vege_burger.price,
			"GChickenS": GChickenS.price,
			"GLambS": GLambS.price,
			"GBeefS": GBeefS.price,
			"sprite": sprite.price,
			"hplus": hplus.price,
			"coco": coco.price,
			"sparkling": sparkling.price,
		}
	}

func save_game(store_name: String = ""):
	var file_path = "user://profile.json"
	var file = FileAccess.open(file_path, FileAccess.WRITE)
	if file:
		var json_string = JSON.stringify(save(), "\t")
		file.store_string(json_string)
		file.close()
		print(" Game data saved to: %s" % file_path)
	else:
		print(" Failed to save game")

func load_game(store_name: String):
	var file_path = "user://profile.json"
	if not FileAccess.file_exists(file_path):
		print(" Save file not found: ", file_path)
		return

	var file = FileAccess.open(file_path, FileAccess.READ)
	var text = file.get_as_text()
	var data = JSON.parse_string(text)

	if typeof(data) == TYPE_DICTIONARY:
		volume_db = data.get("volume_db", 0.0)
		money = data.get("money", 0)
		upgrade = data.get("upgrade", {})
		var prices = data.get("prices", {})
		aglio.price = prices.get("aglio", aglio.price)
		bolognese.price = prices.get("bolognese", bolognese.price)
		carbonara.price = prices.get("carbonara", carbonara.price)
		chicken_sandwich.price = prices.get("chicken_sandwich", chicken_sandwich.price)
		lamb_sandwich.price = prices.get("lamb_sandwich", lamb_sandwich.price)
		beef_sandwich.price = prices.get("beef_sandwich", beef_sandwich.price)
		vege_sandwich.price = prices.get("vege_sandwich", vege_sandwich.price)
		chicken_burger.price = prices.get("chicken_burger", chicken_burger.price)
		lamb_burger.price = prices.get("lamb_burger", lamb_burger.price)
		beef_burger.price = prices.get("beef_burger", beef_burger.price)
		vege_burger.price = prices.get("vege_burger", vege_burger.price)
		GChickenS.price = prices.get("GChickenS", GChickenS.price)
		GLambS.price = prices.get("GLambS", GLambS.price)
		GBeefS.price = prices.get("GBeefS", GBeefS.price)
		sprite.price = prices.get("sprite", sprite.price)
		hplus.price = prices.get("hplus", hplus.price)
		coco.price = prices.get("coco", coco.price)
		sparkling.price = prices.get("sparkling", sparkling.price)
