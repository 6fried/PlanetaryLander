extends Node2D

var dead_zone = false

func _input(event):
	if event.is_action_pressed("ui_landing"):
		if $Player.position.distance_to($PlanetLand/LandingZone.position) < 80:
			$"/root/Global".altitude = $Player.altitude
			$"/root/Global".goto_scene("res://Landing/Scenes/Landing.tscn")

func _process(delta):
	if Input.is_action_pressed ("ui_alt-") or Pad.altm:
		$Player.altitude -= 50 * delta
		$HUD/Altitude/Label.text = "Altitude:%d" % $Player.altitude
	if Input.is_action_pressed("ui_alt+") or Pad.altp:
		$Player.altitude += 50 * delta
		$HUD/Altitude/Label.text = "  Altitude:%d" % $Player.altitude
	
	if $Player.altitude < 500 and dead_zone:
		set_process(false)
		$Player.die()

	if Pad.up:
		$Player.velocity.y -= 1
	if Pad.down:
		$Player.velocity.y += 1
	if Pad.left:
		$Player.velocity.x -= 1
	if Pad.right:
		$Player.velocity.x += 1
	
	
	if $Player.position.x > get_viewport_rect().size.x/2 and $Player.position.x < 1408 - get_viewport_rect().size.x/2:
		$Camera2D.position.x += $Player.velocity.x * delta
		$Camera2D.position.x = clamp($Camera2D.position.x, get_viewport_rect().size.x/2, 1408 - get_viewport_rect().size.x/2)

	$Player.position.x = clamp($Player.position.x, 40, 1468)
	$Player.position.y = clamp($Player.position.y, 48, 1460)

func _on_Player_body_entered(body):
	if body.get_collision_layer_bit(5):
		dead_zone = true
	elif body.get_collision_layer_bit(6):
		$Player.die()
