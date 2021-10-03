extends Control

func _on_Play_pressed():
	Global.goto_scene("res://Game/Scenes/Game.tscn")

func _on_Exit_pressed():
	Global.exit_game()

func _on_Tutorial_pressed():
	Global.goto_scene("res://UI/Scenes/Tutorials.tscn")
