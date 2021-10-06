extends Area2D

func _on_Coin_body_entered(_body):
	$"/root/Global".coins += 1
	queue_free()
