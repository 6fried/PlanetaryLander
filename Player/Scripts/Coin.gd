extends Area2D

func _on_Coin_body_entered(body):
	$"/root/Global".coin = true 
	queue_free()
