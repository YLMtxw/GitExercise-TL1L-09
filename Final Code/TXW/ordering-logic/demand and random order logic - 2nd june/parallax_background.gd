extends ParallaxBackground

@export var scroll_speed: float = 30.0 #this is speed to control the backgorund

func _process(delta):
	scroll_offset.x += scroll_speed * delta
