extends Control

var toaster2 : bool = false
var is_menu_open : bool = false

func openToaster2():
	visible = true
	toaster2 = true

func t2open():
	if toaster2 == true:
		is_menu_open = true
	return toaster2

func closeToaster2():
	visible = false
	toaster2 = false

func t2close():
	if toaster2 == false:
		is_menu_open = false
