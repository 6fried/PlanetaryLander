extends KinematicBody2D

signal body_entered
export (int) var altitude = 11
onready var velocity = Vector2.ZERO
onready var speed = 150

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

func _physics_process(delta):
	if not velocity.x == 0:
		$AnimatedSprite.play("default")
	else:
		$AnimatedSprite.set("frame", 0)
		$AnimatedSprite.stop()
#	velocity = move_and_slide(velocity)

	position += velocity * delta


func _on_Area2D_body_entered(body):
	if !body.get_collision_layer_bit(0):
		emit_signal("body_entered", body)

func die():
	queue_free()
