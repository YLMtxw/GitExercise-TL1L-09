class_name Menu extends Control

var menu1 : bool = false

func openMenu():
	visible = true
	menu1 = true

func closeMenu():
	visible = false
	menu1 = false
