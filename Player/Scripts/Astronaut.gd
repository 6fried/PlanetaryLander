extends Actor

func _physics_process(delta):
	var is_jump_interrupted = Input.is_action_just_released("ui_jump") and _velocity.y < 0.0
	var direction = get_direction()
	_velocity = calculate_move_velocity(_velocity, direction, speed, is_jump_interrupted)
	var snap: Vector2 = Vector2.DOWN * 60.0 if direction.y == 0.0 else Vector2.ZERO
	_velocity = move_and_slide_with_snap(
		_velocity, snap, FLOOR_NORMAL, true
	)
	animate()

func get_direction() -> Vector2:
	return Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		-Input.get_action_strength("ui_jump") * 1.5 if is_on_floor() and Input.is_action_just_pressed("ui_jump") else 0.0
	)

func calculate_move_velocity(
		linear_velocity: Vector2,
		direction: Vector2,
		speed: Vector2,
		is_jump_interrupted: bool
	) -> Vector2:
	var velocity: = linear_velocity
	velocity.x = speed.x * direction.x
	if direction.y != 0.0:
		velocity.y = speed.y * direction.y
	if is_jump_interrupted:
		velocity.y = 0.0
	return velocity

func animate():
	if _velocity.x > 0:
		$AnimatedSprite.play("right_walk")
	elif _velocity.x < 0:
		$AnimatedSprite.play("left_walk")
	else:
		$AnimatedSprite.set("frame", 0)
		$AnimatedSprite.stop()


func _on_EnnemyDetector_body_entered(body):
	if body.get_collision_layer_bit(1):
		die()


func die():
	queue_free()
	Global.lose()
