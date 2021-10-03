extends Node2D

func _on_Area2D_body_entered(body):
	if body == $Player and Global.coin:
		$"/root/Global".win()

func _process(delta):
	$Player/Camera2D.position.x = clamp($Player/Camera2D.position.x, get_viewport_rect().size.x/2, 8320-get_viewport_rect().size.x/2)
	$Player/Camera2D.position.y = clamp($Player/Camera2D.position.y, get_viewport_rect().size.y/2, 2048-get_viewport_rect().size.y/2)

