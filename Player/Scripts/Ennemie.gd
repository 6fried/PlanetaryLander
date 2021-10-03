extends StaticBody2D

var bullet = preload("res://Player/Scenes/Bullet.tscn")

func _on_Timer_timeout():
	var b = bullet.instance()
	add_child(b)
