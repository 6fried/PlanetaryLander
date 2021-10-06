extends StaticBody2D

var velocity = Vector2(-300, 0)


func _ready():
	set_physics_process(true)

func _physics_process(delta):
	position += velocity * delta


func _on_Bullet_body_entered(_body):
	$"/root/Global".lose()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
