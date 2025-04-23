extends Button

func _on_tutorial_button_pressed():
	print("Tutorial button clicked!")
	$TutorialPopup.popup_centered()
