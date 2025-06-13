extends Control

const SAVE_PATH := "res://DATA//player_progress.cfg"

var coins := 0
var upgrade_level := 0
var current_round := 0

func save():
	var cfg := ConfigFile.new()
	cfg.set_value("Progress", "coins", coins)
	cfg.set_value("Progress", "upgrade_level", upgrade_level)
	cfg.set_value("Progress", "current_round", current_round)
	cfg.save(SAVE_PATH)

func load():
	var cfg := ConfigFile.new()
	if cfg.load(SAVE_PATH) != OK:
		return  # 无存档可加载
	coins = cfg.get_value("Progress", "coins", 0)
	upgrade_level = cfg.get_value("Progress", "upgrade_level", 1)
	current_round = cfg.get_value("Progress", "current_round", 1)
