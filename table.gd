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


var max := 3
var text : String = "max"
var lock_confirm := false
var accept_button_disabled = false

const PlayerData = preload("user://H.json")
@onready var Global = get_node("/root/Global")


func _input(event):
	if event is InputEventKey and event.pressed and event.keycode == KEY_ESCAPE:
		get_tree().quit()
	
	
func _ready():
		
	# 给所有按钮连接 signal
	for button in $Button2.get_children():
		if button is Button or button is TextureButton:
			button.pressed.connect(_on_button_2_pressed)
	
	var money = 0  # 改成你真实路径

	var player_data = load_player_data()
		
	if Global.load_game(Global.current_store_name):
		var upgrades = Global.player_data.upgrades
		count = upgrades.get("count", 0)
		count2 = upgrades.get("count2", 0)
		count3 = upgrades.get("count3", 0)
		count4 = upgrades.get("count4", 0)
		count5 = upgrades.get("count5", 0)
		count6 = upgrades.get("count6", 0)
		count7 = upgrades.get("count7", 0)
		count8 = upgrades.get("count8", 0)
		count9 = upgrades.get("count9", 0)
		count10 = upgrades.get("count10", 0)
		count11 = upgrades.get("count11", 0)
		count12 = upgrades.get("count12", 0)
		count13 = upgrades.get("count13", 0)
		count14 = upgrades.get("count14", 0)
		count15 = upgrades.get("count15", 0)
		count16 = upgrades.get("count16", 0)
		count17 = upgrades.get("count17", 0)
		count18 = upgrades.get("count18", 0)
		
		label.text = str(count) if count < max else text
		label2.text = str(count2) if count2 < max else text
		label3.text = str(count3) if count3 < max else text
		label4.text = str(count4) if count4 < max else text
		label5.text = str(count5) if count5 < max else text
		label6.text = str(count6) if count6 < max else text
		label7.text = str(count7) if count7 < max else text
		label8.text = str(count8) if count8 < max else text
		label9.text = str(count9) if count9 < max else text
		label10.text = str(count10) if count10 < max else text
		label11.text = str(count11) if count11 < max else text
		label12.text = str(count12) if count12 < max else text
		label13.text = str(count13) if count13 < max else text
		label14.text = str(count14) if count14 < max else text
		label15.text = str(count15) if count15 < max else text
		label16.text = str(count16) if count16 < max else text
		label17.text = str(count17) if count17 < max else text
		label18.text = str(count18) if count18 < max else text
		
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
	
	var money_display = get_node_or_null("/root/Playground/CanvasLayer/MoneyLabel")
	var player = get_node_or_null("/root/Playground/Player_character")
	
	if money_display == null:
		push_error("MoneyLabel not found at: /root/Playground/CanvasLayer/MoneyLabel")
		get_tree().change_scene_to_file("res://playground.tscn")
		return
	   
	if player == null:
		push_error("Player_character not found at: /root/Playground/Player_character")
		get_tree().change_scene_to_file("res://playground.tscn")
		return
	
	if not money_display.has("money"):
		push_error("MoneyLabel has no 'money' property")
		get_tree().change_scene_to_file("res://playground.tscn")
		return
	
	Global.player_data = {
		"money": money_display.money,
		"position": player.global_position,
		"upgrades": {
			"count": count,
			"count2": count2,
			"count3": count3,
			"count4": count4,
			"count5": count5,
			"count6": count6,
			"count7": count7,
			"count8": count8,
			"count9": count9,
			"count10": count10,
			"count11": count11,
			"count12": count12,
			"count13": count13,
			"count14": count14,
			"count15": count15,
			"count16": count16,
			"count17": count17,
			"count18": count18
		}
	}  
	Global.save_data()
	get_tree().change_scene_to_file("res://playground.tscn")

func _on_upgrade_button_pressed() -> void:
	get_tree().paused = true
	$ClickSound.play()	
	id = 1
	confirm.visible = true


func _on_upgrade_button_2_pressed() -> void:
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
			if count == 3:
				label.text = str(text)
				accept_button_disabled = true
				print("达到最大值")

			print("Aglio Olio")
		id = 0
		
	elif id == 2:
		if count2 >= 3:
			return 
		if count2 < max:
			count2 += 1
			label2.text = str(count2)
			if count2 == 3:
				label2.text = str(text)
				accept_button_disabled = true
				print("达到最大值")
		id = 0
		
	elif id == 3:
		if count3 >= 3:
			return 
		if count3 < max:
			count3 += 1
			label3.text = str(count3)
			if count3 == 3:
				label3.text = str(text)
				accept_button_disabled = true
			print("达到最大值")
		id = 0
		
	elif id == 4:
		if count4 >= 3:
			return 
		if count4 < max:
			count4 += 1
			label4.text = str(count4)
			if count4 == 3:
				label4.text = str(text)
				accept_button_disabled = true
			print("达到最大值")
		id = 0
		
	elif id == 5:
		if count5 >= 3:
			return 
		if count5 < max:
			count5 += 1
			label5.text = str(count5)
			if count5 == 3:
				label5.text = str(text)
				accept_button_disabled = true
			print("达到最大值")
		id = 0
		
	elif id == 6:
		if count6 >= 3:
			return 
		if count6 < max:
			count6 += 1
			label6.text = str(count6)
			if count6 == 3:
				label6.text = str(text)
				accept_button_disabled = true
			print("达到最大值")
		id = 0
		
	elif id == 7:
		if count7 >= 3:
			return 
		if count7 < max:
			count7 += 1
			label7.text = str(count7)
			if count7 == 3:
				label7.text = str(text)
				accept_button_disabled = true
			print("达到最大值")
		id = 0
		
	elif id == 8:
		if count8 >= 3:
			return 
		if count8 < max:
			count8 += 1
			label8.text = str(count8)
			if count8 == 3:
				label8.text = str(text)
				accept_button_disabled = true
			print("达到最大值")
		id = 0
		
	elif id == 9:
		if count9 >= 3:
			return 
		if count9 < max:
			count9 += 1
			label9.text = str(count9)
			if count9 == 3:
				label9.text = str(text)
				accept_button_disabled = true
			print("达到最大值")
		id = 0
		
	elif id == 10:
		if count10 >= 3:
			return 
		if count10 < max:
			count10 += 1
			label10.text = str(count10)
			if count10 == 3:
				label10.text = str(text)
				accept_button_disabled = true
			print("达到最大值")
		id = 0
		
	elif id == 11:
		if count11 >= 3:
			return 
		if count11 < max:
			count11 += 1
			label11.text = str(count11)
			if count11 == 3:
				label11.text = str(text)
				accept_button_disabled = true
			print("达到最大值")
		id = 0
		
	elif id == 12:
		if count12 >= 3:
			return 
		if count12 < max:
			count12 += 1
			label12.text = str(count12)
			if count12 == 3:
				label12.text = str(text)
				accept_button_disabled = true
			print("达到最大值")
		id = 0
		
	elif id == 13:
		if count13 >= 3:
			return 
		if count13 < max:
			count13 += 1
			label13.text = str(count13)
			if count13 == 3:
				label13.text = str(text)
				accept_button_disabled = true
			print("达到最大值")
		print("Bolognese")
		id = 0
		
	elif id == 14:
		if count4 >= 3:
			return 
		if count14 < max:
			count14 += 1
			$"photo1/blue box8/Level/Label2".text = str(count14)
			if count14 == 3:
				label14.text = str(text)
				accept_button_disabled = true
			print("达到最大值")
		print("Bolognese")
		id = 0
		
	elif id == 15:
		if count15 >= 3:
			return 
		if count15 < max:
			count15 += 1
			label15.text = str(count15)
			if count15 == 3:
				label15.text = str(text)
				confirm.visible = true
				accept_button_disabled = true
			print("达到最大值")
		print("Bolognese")
		id = 0
		
	elif id == 16:
		if count16 >= 3:
			return 
		if count16 < max:
			count16 += 1
			label16.text = str(count16)
			if count16 == 3:
				label16.text = str(text)
				confirm.visible = true
				accept_button_disabled = true
			print("达到最大值")
		print("Bolognese")
		id = 0
		
	elif id == 17:
		if count17 >= 3:
			return 
		if count17 < max:
			count17 += 1
			label17.text = str(count17)
			if count17 == 3:
				label17.text = str(text)
				confirm.visible = true
				accept_button_disabled = true
			print("达到最大值")
		print("Bolognese")
		id = 0
		
	elif id == 18:
		if count18 >= 3:
			return 
		if count18 < max:
			count18 += 1
			label18.text = str(count18)
			if count18 == 3:
				label18.text = str(text)
				confirm.visible = true
				accept_button_disabled = true
			print("达到最大值")
		print("Bolognese")
		id = 0
	
	elif id == 19:
			lock19.visible = false
			label19.visible = true
			confirm.visible = true
			Cactus.is_visible = true
			id = 0
		
	elif id == 20:
		label20.visible = true
		lock20.visible = false
		confirm.visible = true
		Frame01.frame_visible = true
		id = 0
		
	elif id == 21:
		label21.visible = true
		lock21.visible = false
		confirm.visible = true
		Pot01.pot_visible = true
		id = 0
		
	elif id == 22:
		label22.visible = true
		lock22.visible = false
		confirm.visible = true
		Bin01.bin_visible = true
		id = 0

	elif id == 23:
		label23.visible = true
		lock23.visible = false
		confirm.visible = true
		Signboard01.signboard_visible = true
		id = 0

	elif id == 24:
		label24.visible = true
		lock24.visible = false
		confirm.visible = true
		Td01.td_visible = true
		id = 0

	elif id == 25:
		label25.visible = true
		lock25.visible = false
		confirm.visible = true
		Tt01.tt_visible = true
		id = 0
		
	elif id == 26:
		label26.visible = true
		lock26.visible = false
		confirm.visible = true
		Vvip.vvip_visible = true
		id = 0

	if not lock_confirm:
		confirm.visible = false  # 正常流程下关闭 confirm
		

func _on_chicken_pressed() -> void:
	get_tree().paused = true
	$ClickSound.play()	
	id = 9
	confirm.visible = true
	board.visible = false


func _on_lamb_pressed() -> void:
	get_tree().paused = true
	$ClickSound.play()	
	id = 10
	confirm.visible = true
	board.visible = false


func _on_beef_pressed() -> void:
	get_tree().paused = true
	$ClickSound.play()	
	id = 11
	confirm.visible = true
	board.visible = false
	
	
func _on_vege_pressed() -> void:
	get_tree().paused = true
	$ClickSound.play()	
	id = 12
	confirm.visible = true
	board.visible = false


func _on_select_button_pressed() -> void:
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
	get_tree().paused = true
	$ClickSound.play()	
	id = 3
	confirm.visible = true


func _on_upgrade_button_4_pressed() -> void:
	get_tree().paused = true
	$ClickSound.play()	
	id = 4
	confirm.visible = true


func _on_upgrade_button_5_pressed() -> void:
	$ClickSound.play()	
	id = 8
	board2.visible = true


func _on_upgrade_button_7_pressed() -> void:
	get_tree().paused = true
	$ClickSound.play()	
	id = 13
	confirm.visible = true


func _on_chicken_01_pressed() -> void:
	get_tree().paused = true
	$ClickSound.play()	
	id = 5
	confirm.visible = true
	board2.visible = false


func _on_lamb_01_pressed() -> void:
	get_tree().paused = true
	$ClickSound.play()	
	id = 6
	confirm.visible = true
	board2.visible = false


func _on_beef_01_pressed() -> void:
	get_tree().paused = true
	$ClickSound.play()	
	id = 7
	confirm.visible = true
	board2.visible = false


func _on_egg_mayo_01_pressed() -> void:
	get_tree().paused = true
	$ClickSound.play()	
	id = 8
	confirm.visible = true
	board2.visible = false


func _on_upgrade_button_8_pressed() -> void:
	get_tree().paused = true
	$ClickSound.play()	
	id = 14
	confirm.visible = true


func _on_button_sparkling_pressed() -> void:
	get_tree().paused = true
	$ClickSound.play()
	id = 15
	confirm.visible = true


func _on_wrong_pressed() -> void:
		$"max sound".play()


func _on_coming_soon_pressed() -> void:
		$"max sound".play()


func _on_button_sprite_pressed() -> void:
	get_tree().paused = true
	$ClickSound.play()
	id = 16
	confirm.visible = true


func _on_plus_pressed() -> void:
	get_tree().paused = true
	$ClickSound.play()
	id = 17
	confirm.visible = true


func _on_coke_pressed() -> void:
	get_tree().paused = true
	$ClickSound.play()
	id = 18   
	confirm.visible = true
  


func _on_cactus_button_pressed() -> void:
	get_tree().paused = true
	$ClickSound.play()
	id = 19
	confirm.visible = true


func _on_frame_button_pressed() -> void:
	get_tree().paused = true
	$ClickSound.play()
	id = 20
	confirm.visible = true


func _on_plant_pot_button_pressed() -> void:
	get_tree().paused = true
	$ClickSound.play()
	id = 21
	confirm.visible = true


func _on_bin_lock_button_pressed() -> void:
	get_tree().paused = true
	$ClickSound.play()
	id = 22
	confirm.visible = true


func _on_signboard_button_pressed() -> void:
	get_tree().paused = true
	$ClickSound.play()
	id = 23
	confirm.visible = true


func _on_table_deco_button_pressed() -> void:
	get_tree().paused = true
	$ClickSound.play()
	id = 24
	confirm.visible = true


func _on_table_tresure_button_pressed() -> void:
	get_tree().paused = true
	$ClickSound.play()
	id = 25
	confirm.visible = true


func _on_vvip_carpet_pressed() -> void:
	get_tree().paused = true
	$ClickSound.play()
	id = 26
	confirm.visible = true
