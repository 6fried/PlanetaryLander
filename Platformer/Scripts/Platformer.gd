extends Node2D

func _ready():
	Global.coins = 0
	Global.latest_stage = "res://Platformer/Scenes/Platformer.tscn"

func _on_Area2D_body_entered(body):
	if body == $Player and Global.coins == 2:
		$"/root/Global".win()

func _process(_delta):
	$Player/Camera2D.position.x = clamp($Player/Camera2D.position.x, get_viewport_rect().size.x/2, 8320-get_viewport_rect().size.x/2)
	$Player/Camera2D.position.y = clamp($Player/Camera2D.position.y, get_viewport_rect().size.y/2 - 2048, get_viewport_rect().size.y/2)

#	if Pad.left:
#		Input.action_press("ui_left")
#	else:
#		Input.action_release("ui_left")
#	if Pad.right:
#		Input.action_press("ui_right")
#	elif !Input.is_action_pressed("ui_right"):
#		Input.action_release("ui_right")
#	if Pad.jump:
#		Input.action_press("ui_jump")
#	else:
#		Input.action_release("ui_jump")


func _on_LifeBarLayer_timeout():
	Global.lose("You are out of oxygen !")
