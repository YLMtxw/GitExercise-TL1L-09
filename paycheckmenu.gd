extends Control

var paycheck = false

func open_paycheck():
	paycheck = true
	visible = true

func close_paycheck():
	paycheck = false 
	visible = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
