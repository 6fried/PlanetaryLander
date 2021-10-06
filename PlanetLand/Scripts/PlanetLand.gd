extends Node2D

var dead_zone

func _on_DeadZone_body_entered(body):
	dead_zone = true
