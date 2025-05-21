extends Control

@onready var sprite_a = $photo1
@onready var sprite_b = $photo2
@onready var sprite_c = $photo3
@onready var sprite_d = $photo4
@onready var confirm = $CanvasLayer/Comfirmation

func _input(event):

	if event is InputEventKey and event.pressed and event.keycode == KEY_ESCAPE:
		get_tree().quit()

func _ready():
	# 给所有按钮连接 signal
	for button in $Button2.get_children():
		if button is Button or button is TextureButton:
			button.connect("pressed", Callable(self, "_on_button_2_pressed"))


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
