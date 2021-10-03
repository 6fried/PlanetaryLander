extends KinematicBody2D

export (int) var altitude = 1000
onready var velocity = Vector2.ZERO
onready var speed = 100

func _input(_event):
	#Get velocity Input
	velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_up"):
		velocity.y-=1
	if Input.is_action_pressed("ui_down"):
		velocity.y+=1
	if Input.is_action_pressed("ui_left"):
		velocity.x-=1
	if Input.is_action_pressed("ui_right"):
		velocity.x+=1
	velocity = velocity.normalized() * speed

func _process(delta):
	if not velocity.x == 0:
		$AnimatedSprite.play("default")
	else:
		$AnimatedSprite.set("frame", 0)
	move_and_slide(velocity)
