extends Node2D

var dead_zone = false

func _ready():
	$HUD/Altitude/Label.text = "Altitude:%d km" % $Player.altitude
	Global.latest_stage = "res://Game/Scenes/Game.tscn"

func _input(event):
	if event.is_action_pressed("ui_land"):
		if $Player.position.distance_to($PlanetLand/LandingZone.position) < 80:
			$"/root/Global".altitude = $Player.altitude
			$"/root/Global".goto_scene("res://Landing/Scenes/Landing.tscn")

func _process(delta):
	if Input.is_action_pressed ("ui_alt-") or Pad.altm:
		$Player.altitude -= delta
	if Input.is_action_pressed("ui_alt+") or Pad.altp:
		$Player.altitude += delta

	$Player.altitude -= 0.4 * delta
	$Player.altitude = clamp($Player.altitude, 0, 20)
	$HUD/Altitude/Label.text = "  Altitude:%d km" % $Player.altitude

	if ($Player.altitude < 2 and dead_zone) or $Player.altitude == 0:
		set_process(false)
		$Player.die()
		Global.lose("You are too low, the area is uneven !")
		
#	if Pad.up:
#		Input.action_press("ui_up")
#	else:
#		Input.action_release("ui_up")
#	if Pad.down:
#		Input.action_press("ui_down")
#	else:
#		Input.action_release("ui_down")
#	if Pad.left:
#		Input.action_press("ui_left")
#	else:
#		Input.action_release("ui_left")
#	if Pad.right:
#		Input.action_press("ui_right")
#	else:
#		Input.action_release("ui_right")
#	if Pad.land:
#		Input.action_press("ui_land")
#	else:
#		Input.action_release("ui_land")
	
	if $Player.position.x > get_viewport_rect().size.x/2 and $Player.position.x < 1408 - get_viewport_rect().size.x/2:
		$Camera2D.position.x += $Player.velocity.x * delta
		$Camera2D.position.x = clamp($Camera2D.position.x, get_viewport_rect().size.x/2, 1408 - get_viewport_rect().size.x/2)

	$Player.position.x = clamp($Player.position.x, 40, 1368)
	$Player.position.y = clamp($Player.position.y, 48, 560)


func _on_Player_body_entered(body):
	if body.get_collision_layer_bit(5):
		dead_zone = true
	elif body.get_collision_layer_bit(6):
		$Player.die()
		Global.lose("You have entered forbidden territory!")
