class_name InteractE extends Label

var EPrompt : bool = false
var EP_pos = Vector2(-9,-55)

func showE():
	visible = true
	EPrompt = true

func hideE():
	visible = false
	EPrompt = false
