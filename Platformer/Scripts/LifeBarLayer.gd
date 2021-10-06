extends CanvasLayer

signal timeout

func _ready():
	$TextureProgress.max_value = 100

func _process(delta):
	$TextureProgress.value -= delta
	if $TextureProgress.value == 0:
		emit_signal("timeout")
