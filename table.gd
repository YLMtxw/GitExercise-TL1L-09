extends Control

@onready var sprite_a = $photo1
@onready var sprite_b = $photo2
@onready var sprite_c = $photo3
@onready var sprite_d = $photo4
@onready var confirm = $CanvasLayer/Comfirmation
@onready var board = $"CanvasLayer/burger board"
@onready var level =  $"photo1/blue box/level2"
@onready var coin_label = $"MoneyBox/Coin Label"  # 假设您有一个名为 MoneyLabel 的 Label 节点

const PlayerData = preload("res://DATA/PlayerData.gd")

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
	if player_data:
		money = player_data.money
		coin_label.text = str(money)
	else:
		coin_label.text = "none"
		
func load_player_data() -> PlayerData:#读取 JSON 并变成 PlayerData
	var file_path = "res://DATA/Hello.json"
	if FileAccess.file_exists(file_path):
		var json_string = FileAccess.get_file_as_string(file_path)
		var player_data = JsonClassConverter.json_string_to_class(PlayerData, json_string)
		if player_data != null:
			return player_data
		else:
			push_error("无法解析 JSON 数据。")
	else:
		push_error("找不到 JSON 文件：%s" % file_path)
	return null


func _on_button_2_pressed() -> void:
	$ClickSound.play()
	# 显示 A，隐藏 B
	sprite_a.visible = false
	sprite_b.visible = true
	sprite_c.visible = false
	sprite_d.visible = false
	
"res://song/G.E.M.鄧紫棋無雙的王者Peerless KingOfficial Music Video.mp3"

func _on_button_1_pressed() -> void:
	$ClickSound.play()
		# 显示 A，隐藏 B
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
	get_tree().change_scene_to_file("res://playground.tscn")


func _on_upgrade_button_pressed() -> void:
	$ClickSound.play()	
	confirm.visible = true


func _on_upgrade_button_2_pressed() -> void:
	$ClickSound.play()	
	confirm.visible = true

func _on_cancel_button_pressed() -> void:
	$ClickSound.play()
	confirm.visible = false


func _on_accept_button_pressed() -> void:
	$ClickSound.play()
	confirm.visible = false



func _on_texture_button_pressed() -> void:
	$ClickSound.play()	
	confirm.visible = true
	board.visible = false


func _on_lamb_pressed() -> void:
	$ClickSound.play()	
	confirm.visible = true
	board.visible = false


func _on_beef_pressed() -> void:
	$ClickSound.play()	
	confirm.visible = true
	board.visible = false
	
func _on_vege_pressed() -> void:
	$ClickSound.play()	
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
