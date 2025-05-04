extends Control

var refri : bool = false
var is_menu_open : bool = false

func openRefri():
	visible = true
	refri = true

func Ropen():
	if refri == true:
		is_menu_open = true
	return refri

func closeRefri():
	visible = false
	refri = false

func Rclose():
	if refri == false:
		is_menu_open = false
