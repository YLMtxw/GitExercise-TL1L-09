extends Control

@onready var sprite_a = $photo1
@onready var sprite_b = $photo2
@onready var sprite_c = $photo3
@onready var sprite_d = $photo4
@onready var confirm = $CanvasLayer/Comfirmation
@onready var board = $"CanvasLayer/burger board"
@onready var board2 = $CanvasLayer/sandwich
@onready var level =  $"photo1/blue box/level2"
@onready var coin_label = $"MoneyBox/Coin_Label"
@onready var accept_button = $"AcceptButton"

  
@onready var label = $"photo1/blue box/Label"
@onready var label2 = $"photo1/blue box2/Label 2"
@onready var label3 = $"photo1/blue box3/Label"
@onready var label4 = $"photo1/blue box4/Label"
@onready var label5 = $"photo1/blue box5/Label"
@onready var label6 = $"photo1/blue box5/Label2"
@onready var label7 = $"photo1/blue box5/Label3"
@onready var label8 = $"photo1/blue box5/Label4"
@onready var label9 = $"photo1/blue box6/Label"
@onready var label10 = $"photo1/blue box6/Label2"
@onready var label11 = $"photo1/blue box6/Label3"
@onready var label12 = $"photo1/blue box6/Label4"
@onready var label13 = $"photo1/blue box7/Label2"
@onready var label14 = $"photo1/blue box8/Level/Label2"
@onready var label15 = $"photo2/blue box/Level/Label2"
@onready var label16 = $"photo2/blue box2/Level/Label2"
@onready var label17 = $"photo2/blue box3/Level/Label2"
@onready var label18 = $"photo2/blue box4/Level/Label2"
@onready var label19 = $"photo3/box 1"
@onready var label20 = $"photo3/box 2"
@onready var label21 = $"photo3/box 3"
@onready var label22 = $"photo3/box 4"
@onready var label23 = $"photo3/box 5"
@onready var label24 = $"photo3/box 6"
@onready var label25 = $"photo3/box 7"
@onready var label26 = $"photo3/box 8"


@onready var lock19 = $photo3/CactusLock
@onready var lock20 = $"photo3/Frame lock"
@onready var lock21 = $photo3/PlantPotLock
@onready var lock22 = $photo3/BinLock
@onready var lock23 = $photo3/SignboardLock
@onready var lock24 = $"photo3/Table deco"
@onready var lock25 = $"photo3/table tresure"
@onready var lock26 = $"photo3/VVIP carpet"


@onready var cactus = get_node("/root/Cactus")


var id = 0
var count := 0
var count2 := 0
var count3 := 0
var count4 := 0
var count5 := 0
var count6 := 0
var count7 := 0 
var count8 := 0
var count9 := 0
var count10 := 0
var count11 := 0
var count12 := 0
var count13 := 0
var count14 := 0
var count15 := 0
var count16 := 0
var count17 := 0
var count18 := 0
var count19 := 0
var count20 := 0
var count21 := 0
var count22 := 0
var count23 := 0
var count24 := 0
var count25 := 0
var count26 := 0


var max := 3
var max2 := 1
var text : String = "max"
var lock_confirm := false
var accept_button_disabled = false


const PlayerData = preload("user://profile.json")
@onready var Global = get_node("/root/Global")
@onready var pInventory : Inventory = preload("res://Inventory/playerInventory.tres")

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

func _input(event):
	if event is InputEventKey and event.pressed and event.keycode == KEY_ESCAPE:
		get_tree().quit()
	
	
func _ready():
		
	# 给所有按钮连接 signal
	for button in $Button2.get_children():
		if button is Button or button is TextureButton:
			button.pressed.connect(_on_button_2_pressed)
		
	Global.load_game(Global.current_store_name)
	
	# Apply loaded upgrade levels to UI
	count = Global.upgrade.get("count1", 0)
	label.text = str(count if count < max else text)
	
	count2 = Global.upgrade.get("count2", 0)
	label2.text = str(count2 if count2 < max else text)
	
	count3 = Global.upgrade.get("count3", 0)
	label3.text = str(count3 if count3 < max else text)
	
	count4 = Global.upgrade.get("count4", 0)
	label4.text = str(count4 if count4 < max else text)
	
	count5 = Global.upgrade.get("count5", 0)
	label5.text = str(count5 if count5 < max else text)
	
	count6 = Global.upgrade.get("count6", 0)
	label6.text = str(count6 if count6 < max else text)
	
	count7 = Global.upgrade.get("count7", 0)
	label7.text = str(count7 if count7 < max else text)
	
	count8 = Global.upgrade.get("count8", 0)
	label8.text = str(count8 if count8 < max else text)
	
	count9 = Global.upgrade.get("count9", 0)
	label9.text = str(count9 if count9 < max else text)
	
	count10 = Global.upgrade.get("count10", 0)
	label10.text = str(count10 if count10 < max else text)
	
	count11 = Global.upgrade.get("count11", 0)
	label11.text = str(count11 if count11 < max else text)
	
	count12 = Global.upgrade.get("count12", 0)
	label12.text = str(count12 if count12 < max else text)
	
	count13 = Global.upgrade.get("count13", 0)
	label13.text = str(count13 if count13 < max else text)
	
	count14 = Global.upgrade.get("count14", 0)
	$"photo1/blue box8/Level/Label2".text = str(count14 if count14 < max else text)
	
	count15 = Global.upgrade.get("count15", 0)
	label15.text = str(count15 if count15 < max else text)
	
	count16 = Global.upgrade.get("count16", 0)
	label16.text = str(count16 if count16 < max else text)
	
	count17 = Global.upgrade.get("count17", 0)
	label17.text = str(count17 if count17 < max else text)
	
	count18 = Global.upgrade.get("count18", 0)
	label18.text = str(count18 if count18 < max else text)
	
	count19 = Global.upgrade.get("count19", 0)
	if count19 >= 1:
		lock19.visible = false
		label19.visible = true
	
	count20 = Global.upgrade.get("count20", 0)
	if count20 >= 1:
		lock20.visible = false
		label20.visible = true
	
	count21 = Global.upgrade.get("count21", 0)
	if count21 >= 1:
		lock21.visible = false
		label21.visible = true
	
	count22 = Global.upgrade.get("count22", 0)
	if count22 >= 1:
		lock22.visible = false
		label22.visible = true
	
	count23 = Global.upgrade.get("count23", 0)
	if count23 >= 1:
		lock23.visible = false
		label23.visible = true
		
	count24 = Global.upgrade.get("count24", 0)
	if count24 >= 1:
		lock24.visible = false
		label24.visible = true
		
	count25 = Global.upgrade.get("count25", 0)
	if count25 >= 1:
		lock25.visible = false
		label25.visible = true
	
	count26 = Global.upgrade.get("count26", 0)
	if count26 >= 1:
		lock26.visible = false
		label26.visible = true
	
	coin_label.text = str(Global.money)
	
	

func load_player_data() -> Object:
	var file_path = "user://profile.json" 
	if FileAccess.file_exists(file_path):
		var json_string = FileAccess.get_file_as_string(file_path)
		if PlayerData != null:
			return PlayerData
		else:
			push_error("❌ 无法解析 JSON 数据。")
	else:
		push_error("❌ 找不到 JSON 文件：%s" % file_path)
	return null

func _on_button_2_pressed() -> void:
	$ClickSound.play()
	# 显示 A，隐藏 B
	sprite_a.visible = false
	sprite_b.visible = true
	sprite_c.visible = false
	sprite_d.visible = false
	

func _on_button_1_pressed() -> void:
	$ClickSound.play()
		# show A，visibleB
	sprite_a.visible = true
	sprite_b.visible = false
	sprite_c.visible = false
	sprite_d.visible = false


func _on_button_3_pressed() -> void:
	$ClickSound.play()
		# 显示 A，隐藏 B
	sprite_a.visible = false
	sprite_b.visible = false
	sprite_c.visible = true
	sprite_d.visible = false

func _on_button_4_pressed() -> void:
	$ClickSound.play()
		# 显示 A，隐藏 B
	sprite_a.visible = false
	sprite_b.visible = false
	sprite_c.visible = false
	sprite_d.visible = true


func _on_exit_button_pressed() -> void:
	$ClickSound01.play()
	await $ClickSound01.finished
	
	pInventory.clear()
	
	var player = get_node_or_null("/root/Playground/Player_character")
	   
	if player == null:
		push_error("Player_character not found at: /root/Playground/Player_character")
		get_tree().change_scene_to_file("res://playground.tscn")
		return
		
	Global.player_data = {
		"position": player.global_position,
	} 
	
	get_tree().change_scene_to_file("res://playground.tscn")

func _on_upgrade_button_pressed() -> void:
	if count == 3:
		$"max sound".play()
		return
	if Global.money < 100:
		$"max sound".play()
		id = 0
		print("not enough money")
	else:
		get_tree().paused = true
		$ClickSound.play()	
		id = 1
		confirm.visible = true


func _on_upgrade_button_2_pressed() -> void:
	if count2 == 3:
		$"max sound".play()
		return
	if Global.money < 100:
		$"max sound".play()
		id = 0
	else:
		get_tree().paused = true
		$ClickSound.play()	
		id = 2
		confirm.visible = true


func _on_cancel_button_pressed() -> void:
	get_tree().paused = false
	$ClickSound.play()
	id = 0 
	print("reset")
	confirm.visible = false



func _on_accept_button_pressed() -> void:	
	
	var cactus = get_node_or_null("/root/Playground/cactus")
	

	

	 
	get_tree().paused = false
	$ClickSound.play()
	if id == 1:
		if count >= 3:
			return  
		if count < max:
			count += 1
			label.text = str(count)
			Global.upgrade["count1"] = count
			Global.money -= 100
			coin_label.text = str(Global.money)
			aglio.price += 10
			Global.save_game(Global.current_store_name)
			if count >= 3:
				count = 3
				label.text = str(text)
				accept_button_disabled = true
				print("达到最大值")
		
	elif id == 2:
		if count2 >= 3:
			return 
		if count2 < max:
			count2 += 1
			label2.text = str(count2)
			Global.upgrade["count2"] = count2
			Global.money -= 100
			coin_label.text = str(Global.money)
			bolognese.price += 10
			Global.save_game(Global.current_store_name)
			if count2 >= 3:
				count2 = 3
				label2.text = str(text)
				accept_button_disabled = true
				print("达到最大值")
		
	elif id == 3:
		if count3 >= 3:
			return 
		if count3 < max:
			count3 += 1
			label3.text = str(count3)
			Global.upgrade["count3"] = count3
			Global.money -= 100
			coin_label.text = str(Global.money)
			carbonara.price += 10
			Global.save_game(Global.current_store_name)
			if count3 >= 3:
				count3 = 3
				label3.text = str(text)
				accept_button_disabled = true
			print("达到最大值")
		
	elif id == 4:
		if count4 >= 3:
			return 
		if count4 < max:
			count4 += 1
			label4.text = str(count4)
			Global.upgrade["count4"] = count4
			Global.money -= 200
			coin_label.text = str(Global.money)
			GChickenS.price += 15
			Global.save_game(Global.current_store_name)
			if count4 >= 3:
				count4 = 4
				label4.text = str(text)
				accept_button_disabled = true
			print("达到最大值")
		
	elif id == 5:
		if count5 >= 3:
			return 
		if count5 < max:
			count5 += 1
			label5.text = str(count5)
			Global.upgrade["count5"] = count5
			Global.money -= 150
			coin_label.text = str(Global.money)
			chicken_sandwich.price += 5
			Global.save_game(Global.current_store_name)
			if count5 >= 3:
				count5 = 3
				label5.text = str(text)
				accept_button_disabled = true
			print("达到最大值")
		
	elif id == 6:
		if count6 >= 3:
			return 
		if count6 < max:
			count6 += 1
			label6.text = str(count6)
			Global.upgrade["count6"] = count6
			Global.money -= 150
			coin_label.text = str(Global.money)
			lamb_sandwich.price += 5
			Global.save_game(Global.current_store_name)
			if count6 >= 3:
				count6 = 3
				label6.text = str(text)
				accept_button_disabled = true
			print("达到最大值")
		
	elif id == 7:
		if count7 >= 3:
			return 
		if count7 < max:
			count7 += 1
			label7.text = str(count7)
			Global.upgrade["count7"] = count7
			Global.money -= 150
			coin_label.text = str(Global.money)
			beef_sandwich.price += 5
			Global.save_game(Global.current_store_name)
			if count7 >= 3:
				count7 = 3
				label7.text = str(text)
				accept_button_disabled = true
			print("达到最大值")
		
	elif id == 8:
		if count8 >= 3:
			return 
		if count8 < max:
			count8 += 1
			label8.text = str(count8)
			Global.upgrade["count8"] = count8
			Global.money -= 150
			coin_label.text = str(Global.money)
			vege_sandwich.price += 5
			Global.save_game(Global.current_store_name)
			if count8 >= 3:
				count8 = 3
				label8.text = str(text)
				accept_button_disabled = true
			print("达到最大值")
		
	elif id == 9:
		if count9 >= 3:
			return 
		if count9 < max:
			count9 += 1
			label9.text = str(count9)
			Global.upgrade["count9"] = count9
			Global.money -= 150
			coin_label.text = str(Global.money)
			chicken_burger.price += 10
			Global.save_game(Global.current_store_name)
			if count9 >= 3:
				count9 = 3
				label9.text = str(text)
				accept_button_disabled = true
			print("达到最大值")
		
	elif id == 10:
		if count10 >= 3:
			return 
		if count10 < max:
			count10 += 1
			label10.text = str(count10)
			Global.upgrade["count10"] = count10
			Global.money -= 150
			coin_label.text = str(Global.money)
			lamb_burger.price += 10
			Global.save_game(Global.current_store_name)
			if count10 >= 3:
				count10 = 3
				label10.text = str(text)
				accept_button_disabled = true
			print("达到最大值")
		
	elif id == 11:
		if count11 >= 3:
			return 
		if count11 < max:
			count11 += 1
			label11.text = str(count11)
			Global.upgrade["count11"] = count11
			Global.money -= 150
			coin_label.text = str(Global.money)
			beef_burger.price += 10
			Global.save_game(Global.current_store_name)
			if count11 >= 3:
				count11 = 3
				label11.text = str(text)
				accept_button_disabled = true
			print("达到最大值")
		
	elif id == 12:
		if count12 >= 3:
			return 
		if count12 < max:
			count12 += 1
			label12.text = str(count12)
			Global.upgrade["count12"] = count12
			Global.money -= 150
			coin_label.text = str(Global.money)
			vege_burger.price += 10
			Global.save_game(Global.current_store_name)
			if count12 >= 3:
				count12 = 3
				label12.text = str(text)
				accept_button_disabled = true
			print("达到最大值")
		
	elif id == 13:
		if count13 >= 3:
			return 
		if count13 < max:
			count13 += 1
			label13.text = str(count13)
			Global.upgrade["count13"] = count13
			Global.money -= 200
			coin_label.text = str(Global.money)
			GLambS.price += 15
			print("GLS price =", GLambS.price)
			Global.save_game(Global.current_store_name)
			if count13 >= 3:
				count13 = 3
				label13.text = str(text)
				accept_button_disabled = true
			print("达到最大值")
		print("Bolognese")
		
	elif id == 14:
		if count14 >= 3:
			return 
		if count14 < max:
			count14 += 1
			$"photo1/blue box8/Level/Label2".text = str(count14)
			Global.upgrade["count14"] = count14
			Global.money -= 200
			coin_label.text = str(Global.money)
			GBeefS.price += 15
			Global.save_game(Global.current_store_name)
			if count14 >= 3:
				count14 = 3
				label14.text = str(text)
				accept_button_disabled = true
			print("达到最大值")
		print("Bolognese")
		
	elif id == 15:
		if count15 >= 3:
			return 
		if count15 < max:
			count15 += 1
			label15.text = str(count15)
			Global.upgrade["count15"] = count15
			Global.money -= 100
			coin_label.text = str(Global.money)
			sparkling.price += 5
			Global.save_game(Global.current_store_name)
			if count15 >= 3:
				count15 = 3
				label15.text = str(text)
				confirm.visible = true
				accept_button_disabled = true
			print("达到最大值")
		print("Bolognese")
		
	elif id == 16:
		if count16 >= 3:
			return 
		if count16 < max:
			count16 += 1
			label16.text = str(count16)
			Global.upgrade["count16"] = count16
			Global.money -= 100
			coin_label.text = str(Global.money)
			sprite.price += 5
			Global.save_game(Global.current_store_name)
			if count16 >= 3:
				count16 = 3
				label16.text = str(text)
				confirm.visible = true
				accept_button_disabled = true
			print("达到最大值")
		print("Bolognese")
		
	elif id == 17:
		if count17 >= 3:
			return 
		if count17 < max:
			count17 += 1
			label17.text = str(count17)
			Global.upgrade["count17"] = count17
			Global.money -= 100
			coin_label.text = str(Global.money)
			hplus.price += 5
			Global.save_game(Global.current_store_name)
			if count17 >= 3:
				count17 = 3
				label17.text = str(text)
				confirm.visible = true
				accept_button_disabled = true
			print("达到最大值")
		print("Bolognese")
		
	elif id == 18:
		if count18 >= 3:
			return 
		if count18 < max:
			count18 += 1
			label18.text = str(count18)
			Global.upgrade["count18"] = count18
			Global.money -= 100
			coin_label.text = str(Global.money)
			coco.price += 5
			Global.save_game(Global.current_store_name)
			if count18 >= 3:
				count18 = 3
				label18.text = str(text)
				confirm.visible = true
				accept_button_disabled = true
			print("达到最大值")
		print("Bolognese")
		
	
	elif id == 19:
		if count19 >= 1:
			return
		if count19 == 0:
			count19 += 1
			Global.upgrade["count19"] = count19
			Global.money -= 150
			coin_label.text = str(Global.money)
			Global.save_game(Global.current_store_name)
			if count19 >= 1:
				lock19.visible = false
				label19.visible = true
				confirm.visible = true
				Cactus.is_visible = true
		
	elif id == 20:
		if count20 >= 1:
			return
		if count20 == 0:
			count20 += 1
			Global.upgrade["count20"] = count20
			Global.money -= 150
			coin_label.text = str(Global.money)
			Global.save_game(Global.current_store_name)
			if count20 >= 1:
				lock20.visible = false
				label20.visible = true
				confirm.visible = true
				Frame01.frame_visible = true
		
	elif id == 21:
		if count21 >= 1:
			return
		if count21 == 0:
			count21 += 1
			Global.upgrade["count21"] = count21
			Global.money -= 100
			coin_label.text = str(Global.money)
			Global.save_game(Global.current_store_name)
			if count21 >= 1:
				lock21.visible = false
				label21.visible = true
				confirm.visible = true
				Pot01.pot_visible = true
		
	elif id == 22:
		if count22 >= 1:
			return
		if count22 == 0:
			count22 += 1
			Global.upgrade["count22"] = count22
			Global.money -= 200
			coin_label.text = str(Global.money)
			Global.save_game(Global.current_store_name)
			if count22 >= 1:
				lock22.visible = false
				label22.visible = true
				confirm.visible = true
				Bin01.bin_visible  = true

	elif id == 23:
		if count23 >= 1:
			return
		if count23 == 0:
			count23 += 1
			Global.upgrade["count23"] = count23
			Global.money -= 250
			coin_label.text = str(Global.money)
			Global.save_game(Global.current_store_name)
			if count23 >= 1:
				lock23.visible = false
				label23.visible = true
				confirm.visible = true
				Signboard01.signboard_visible = true

	elif id == 24:
		if count24 >= 1:
			return
		if count24 == 0:
			count24 += 1
			Global.upgrade["count24"] = count24
			Global.money -= 250
			coin_label.text = str(Global.money)
			Global.save_game(Global.current_store_name)
			if count24 >= 1:
				lock24.visible = false
				label24.visible = true
				confirm.visible = true
				Td01.td_visible = true

	elif id == 25:
		if count25 >= 1:
			return
		if count25 == 0:
			count25 += 1
			Global.upgrade["count25"] = count25
			Global.money -= 300
			coin_label.text = str(Global.money)
			Global.save_game(Global.current_store_name)
			if count25 >= 1:
				lock25.visible = false
				label25.visible = true
				confirm.visible = true
				Tt01.tt_visible = true
		
	elif id == 26:
		if count26 >= 1:
			return
		if count26 == 0:
			count26 += 1
			Global.upgrade["count26"] = count26
			Global.money -= 500
			coin_label.text = str(Global.money)
			Global.save_game(Global.current_store_name)
			if count26 >= 1:
				lock26.visible = false
				label26.visible = true
				confirm.visible = true
				Vvip.vvip_visible = true

	if not lock_confirm:
		confirm.visible = false  # 正常流程下关闭 confirm
		

func _on_chicken_pressed() -> void:
	if count9 == 3:
		$"max sound".play()
		return
	if Global.money < 150:
		$"max sound".play()
		id = 0
	else:
		get_tree().paused = true
		$ClickSound.play()	
		id = 9
		confirm.visible = true
		board.visible = false


func _on_lamb_pressed() -> void:
	if count10 == 3:
		$"max sound".play()
		return
	if Global.money < 150:
		$"max sound".play()
		id = 0
	else:
		get_tree().paused = true
		$ClickSound.play()	
		id = 10
		confirm.visible = true
		board.visible = false


func _on_beef_pressed() -> void:
	if count11 == 3:
		$"max sound".play()
		return
	if Global.money < 150:
		$"max sound".play()
		id = 0
	else:
		get_tree().paused = true
		$ClickSound.play()	
		id = 11
		confirm.visible = true
		board.visible = false
	
	
func _on_vege_pressed() -> void:
	if count12 == 3:
		$"max sound".play()
		return
	if Global.money < 150:
		$"max sound".play()
		id = 0
	else:
		get_tree().paused = true
		$ClickSound.play()	
		id = 12
		confirm.visible = true
		board.visible = false


func _on_select_button_pressed() -> void:
	if count9 == 3 and count10 == 3 and count11 == 3 and count12 == 3:
		$"max sound".play()
		return
	if Global.money < 150:
		$"max sound".play()
		id = 0
	else:
		$ClickSound.play()	
		board.visible = true


func save_player_data():
	var player_data = PlayerData.new()
	player_data.money = coin_label # ✅ 保存用户当前金币到数据对象 
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

	print("✅ 已保存金币到 JSON：",coin_label)


func _on_upgrade_button_3_pressed() -> void:
	if count3 == 3:
		$"max sound".play()
		return
	if Global.money < 100:
		$"max sound".play()
		id = 0
	else:
		get_tree().paused = true
		$ClickSound.play()	
		id = 3
		confirm.visible = true


func _on_upgrade_button_4_pressed() -> void:
	if count4 == 3:
		$"max sound".play()
		return
	if Global.money < 200:
		$"max sound".play()
		id = 0
	else:
		get_tree().paused = true
		$ClickSound.play()	
		id = 4
		confirm.visible = true


func _on_upgrade_button_5_pressed() -> void:
	if count8 == 3:
		$"max sound".play()
		return
	if Global.money < 150:
		$"max sound".play()
		id = 0
	else:
		$ClickSound.play()	
		id = 8
		board2.visible = true


func _on_upgrade_button_7_pressed() -> void:
	if count13 == 3:
		$"max sound".play()
		return
	if Global.money < 200:
		$"max sound".play()
		id = 0
	else:
		get_tree().paused = true
		$ClickSound.play()	
		id = 13
		confirm.visible = true


func _on_chicken_01_pressed() -> void:
	if count5 == 3:
		$"max sound".play()
		return
	if Global.money < 150:
		$"max sound".play()
		id = 0
	else:
		get_tree().paused = true
		$ClickSound.play()	
		id = 5
		confirm.visible = true
		board2.visible = false


func _on_lamb_01_pressed() -> void:
	if count6 == 3:
		$"max sound".play()
		return
	if Global.money < 150:
		$"max sound".play()
		id = 0
	else:
		get_tree().paused = true
		$ClickSound.play()	
		id = 6
		confirm.visible = true
		board2.visible = false


func _on_beef_01_pressed() -> void:
	if count7 == 3:
		$"max sound".play()
		return
	if Global.money < 150:
		$"max sound".play()
		id = 0
	else:
		get_tree().paused = true
		$ClickSound.play()	
		id = 7
		confirm.visible = true
		board2.visible = false


func _on_egg_mayo_01_pressed() -> void:
	if count8 == 3:
		$"max sound".play()
		return
	if Global.money < 150:
		$"max sound".play()
		id = 0
	else:
		get_tree().paused = true
		$ClickSound.play()	
		id = 8
		confirm.visible = true
		board2.visible = false


func _on_upgrade_button_8_pressed() -> void:
	if count14 == 3:
		$"max sound".play()
		return
	if Global.money < 200:
		$"max sound".play()
		id = 0
	else:
		get_tree().paused = true
		$ClickSound.play()	
		id = 14
		confirm.visible = true


func _on_button_sparkling_pressed() -> void:
	if count15 == 3:
		$"max sound".play()
		return
	if Global.money < 100:
		$"max sound".play()
		id = 0
	else:
		get_tree().paused = true
		$ClickSound.play()
		id = 15
		confirm.visible = true


func _on_wrong_pressed() -> void:
		$"max sound".play()


func _on_coming_soon_pressed() -> void:
		$"max sound".play()


func _on_button_sprite_pressed() -> void:
	if count16 == 3:
		$"max sound".play()
		return
	if Global.money < 100:
		$"max sound".play()
		id = 0
	else:
		get_tree().paused = true
		$ClickSound.play()
		id = 16
		confirm.visible = true


func _on_plus_pressed() -> void:
	if count17 == 3:
		$"max sound".play()
		return
	if Global.money < 100:
		$"max sound".play()
		id = 0
	else:
		get_tree().paused = true
		$ClickSound.play()
		id = 17
		confirm.visible = true


func _on_coke_pressed() -> void:
	if count18 == 3:
		$"max sound".play()
		return
	if Global.money < 100:
		$"max sound".play()
		id = 0
	else:
		get_tree().paused = true
		$ClickSound.play()
		id = 18   
		confirm.visible = true
  


func _on_cactus_button_pressed() -> void:
	if count19 >= 1 :
		return
	if Global.money < 150:
		$"max sound".play()
		id = 0
		return
	else:
		get_tree().paused = true
		$ClickSound.play()
		id = 19
		confirm.visible = true
	


func _on_frame_button_pressed() -> void:
	if count20 >= 1:
		return
	if Global.money < 150:
		$"max sound".play()
		id = 0
	else:
		get_tree().paused = true
		$ClickSound.play()
		id = 20
		confirm.visible = true


func _on_plant_pot_button_pressed() -> void:
	if count21 >= 1:
		return
	if Global.money < 100:
		$"max sound".play()
		id = 0
	else:
		get_tree().paused = true
		$ClickSound.play()
		id = 21
		confirm.visible = true


func _on_bin_lock_button_pressed() -> void:
	if count22 >= 1:
		return
	if Global.money < 200:
		$"max sound".play()
		id = 0
	else:
		get_tree().paused = true
		$ClickSound.play()
		id = 22
		confirm.visible = true


func _on_signboard_button_pressed() -> void:
	if count23 >= 1:
		return
	if Global.money < 250:
		$"max sound".play()
		id = 0
	else:
		get_tree().paused = true
		$ClickSound.play()
		id = 23
		confirm.visible = true


func _on_table_deco_button_pressed() -> void:
	if count24 >= 1:
		return
	if Global.money < 250:
		$"max sound".play()
		id = 0
	else:
		get_tree().paused = true
		$ClickSound.play()
		id = 24
		confirm.visible = true


func _on_table_tresure_button_pressed() -> void:
	if count25 >= 1:
		return
	if Global.money < 300:
		$"max sound".play()
		id = 0
	else:
		get_tree().paused = true
		$ClickSound.play()
		id = 25
		confirm.visible = true


func _on_vvip_carpet_pressed() -> void:
	if count26 >= 1:
		return
	if Global.money < 500:
		$"max sound".play()
		id = 0
	else:
		get_tree().paused = true
		$ClickSound.play()
		id = 26
		confirm.visible = true
