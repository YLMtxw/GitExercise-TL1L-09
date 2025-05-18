extends Control

@onready var sprite_a = $photo1
@onready var sprite_b = $photo2

func _ready():
	# 给所有按钮连接 signal
	for button in $Button2.get_children():
		if button is Button or button is TextureButton:
			button.connect("pressed", Callable(self, "_on_button_2_pressed"))


func _on_button_2_pressed() -> void:
	# 显示 A，隐藏 B
	sprite_a.visible = false
	sprite_b.visible = true


func _on_button_1_pressed() -> void:
		# 显示 A，隐藏 B
	sprite_a.visible = true
	sprite_b.visible = false
