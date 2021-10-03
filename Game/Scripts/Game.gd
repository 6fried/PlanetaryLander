extends Node2D

func _input(event):
	if event.is_action_pressed("ui_landing"):
		if $Player.position.distance_to($PlanetLand/Land/LandingZone.position) < 80:
			$"/root/Global".altitude = $Player.altitude
			$"/root/Global".goto_scene("res://Landing/Scenes/Landing.tscn")

func _process(delta):
	if Input.is_action_pressed("ui_alt-"):
		$Player.altitude -= 50
	if Input.is_action_pressed("ui_alt+"):
		$Player.altitude += 50
	$Altitude.text = "Altitude:%d" % $Player.altitude
