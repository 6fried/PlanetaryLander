extends Node2D

var velocity = 0
var GRAVITY = 5


func _ready():
	$Player.velocity =  Vector2(0, 1) * Global.altitude * GRAVITY

func _process(delta):
	if $Player.position.x > get_viewport_rect().size.x/2 and $Player.position.x < 1480 - get_viewport_rect().size.x/2:
		$Camera2D.position.x += $Player.velocity.x * delta
		$Camera2D.position.x = clamp($Camera2D.position.x, get_viewport_rect().size.x/2, 1472 - get_viewport_rect().size.x/2)

	if Pad.up:
		$Player.velocity.y -= 1
	if Pad.down:
		$Player.velocity.y += 1
	if Pad.left:
		$Player.velocity.x -= 1
	if Pad.right:
		$Player.velocity.x += 1

func _on_DeadZone_body_entered(body):
	if body == $Player:
		$"/root/Global".lose()


func _on_Light_zone_body_entered(body):
	if body == $Player:
		Global.goto_scene("res://Platformer/Scenes/Platformer.tscn")
