extends Control

func _on_AnimationPlayer_animation_finished(anim_name):
	Global.goto_scene("res://UI/Scenes/MainMenu.tscn")
