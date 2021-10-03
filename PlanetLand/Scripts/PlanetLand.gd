extends Area2D

func _on_DeadZone_body_entered(body):
	if body.altitude <= 500:
		$"/root/Global".lose()
