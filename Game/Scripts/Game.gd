extends Node2D

func _input(event):
	if event.is_action_pressed("ui_landing"):
		if $Player.position.distance_to($PlanetLand/Land/Area2D.position) < 100:
			$Sprite.show()
