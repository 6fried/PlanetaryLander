extends Node2D

const GRAVITY =Vector2(0,  0003.721) # km/s2

func _ready():
	Global.latest_stage = "res://Landing/Scenes/Landing.tscn"

func _process(delta):
	if $Player.position.x > get_viewport_rect().size.x/2 and $Player.position.x < 1472 - get_viewport_rect().size.x/2:
		$Camera2D.position.x += $Player.velocity.x * delta
#		$Camera2D.position.x = clamp($Camera2D.position.x, get_viewport_rect().size.x/2, 1472 - get_viewport_rect().size.x/2)
#
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

	$Player.position += GRAVITY * delta

	$Player.position.x = clamp($Player.position.x, 40, 1432)
	$Player.position.y = clamp($Player.position.y, 48, 560)

func _on_DeadZone_body_entered(body):
	if body == $Player:
		$"/root/Global".lose("You have landed on an unsuitable ground!")

func _on_Light_zone_body_entered(body):
	if body == $Player:
		Global.goto_scene("res://Platformer/Scenes/Platformer.tscn")
