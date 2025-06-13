extends Node2D



func get_player_file_path() -> String:
	return "user://profile.json"
	

func _input(event):

	if event is InputEventKey and event.pressed and event.keycode == KEY_ESCAPE:
		get_tree().quit()

func _on_texture_button_pressed() -> void:
	$ClickSound.play()
	var name = $"Control/Shop name".text.strip_edges()

	if name == "":
		$Control/Label2.text = "店名不能为空"
	else:
		$Control/Label2.text = "COMPLETE！"
		await $ClickSound.finished
		
		# ✅ 保存为 JSON
		var data = {
			"shop_name": name
		}
		var json_text = JSON.stringify(data)
		var file = FileAccess.open(get_player_file_path(), FileAccess.WRITE)
		file.store_string(json_text)
		file.close()
		print("✅ 玩家资料已保存: ", json_text)
				
		# 跳转到主游戏
		get_tree().change_scene_to_file("res://playground.tscn")
	
func _on_shop_name_focus_exited() -> void:
	var input_name = $"Control/Shop name".text.strip_edges()  # 用户输入的文件名
	
	if input_name == "":
		print("❌ 文件名不能为空")
		$ErrorLabel.text = "请输入店铺名称。"
		return
		
