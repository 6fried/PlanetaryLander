extends KinematicBody2D

onready var velocity = Vector2(0, 0)
onready var is_jumping = false
const SPEED = 180
const GRAVITY = 30
const JUMPFORCE = -900

func _input(event):
	#Get velocity Input
	velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
	if Input.is_action_pressed("ui_right"):
		velocity.x = SPEED

	if event.is_action_pressed("ui_jump"):
		velocity.y = JUMPFORCE


func _physics_process(delta):
	velocity.y += GRAVITY
	velocity = move_and_slide(velocity)
	animate()

func animate():
	if velocity.x > 0:
		$AnimatedSprite.play("right_walk")
	elif velocity.x < 0:
		$AnimatedSprite.play("left_walk")
	else:
		$AnimatedSprite.set("frame", 0)
		$AnimatedSprite.stop()

