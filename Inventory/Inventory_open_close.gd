class_name InvOpenClose extends Control

var InvOpen: bool = false

func open():
	visible = true
	InvOpen = true

func close():
	visible = false
	InvOpen = false
