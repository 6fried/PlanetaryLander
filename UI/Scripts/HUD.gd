extends CanvasLayer

func _on_MainMenu_pressed():
	Global.goto_scene("res://UI/Scenes/MainMenu.tscn")

func _on_Restart_Level_pressed():
	Global.goto_scene("res://Game/Scenes/Game.tscn")


func _on_Restart_Stage_pressed():
	Global.goto_scene(Global.latest_stage)
