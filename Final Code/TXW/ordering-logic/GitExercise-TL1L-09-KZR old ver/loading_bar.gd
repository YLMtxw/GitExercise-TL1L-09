extends Control

var loading : bool = false
signal loading_finished
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false
	loading = false
	$Timer.stop()

func show_bar():
	visible = true
	loading = true
	$TextureProgressBar.value = 0
	$Timer.start()

func close_bar():
	visible = false
	loading = false
	$Timer.stop()
	$TextureProgressBar.value = 0
	emit_signal("loading_finished")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	$TextureProgressBar.value += 1
	if $TextureProgressBar.value >= $TextureProgressBar.max_value:
		close_bar()
