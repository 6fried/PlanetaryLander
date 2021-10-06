extends CanvasLayer

# Buttons down

func _on_Up_button_down():
#	Input.action_press("ui_up")
	Pad.up = true
func _on_Down_button_down():
	Input.action_press("ui_down")

func _on_Left_button_down():
	Input.action_press("ui_left")

func _on_Right_button_down():
	Input.action_press("ui_right")

func _on_Pause_button_down():
	Input.action_press("ui_pause")

func _on_Altp_button_down():
	Input.action_press("ui_alt+")

func _on_Altm_button_down():
	Input.action_press("ui_alt+")

func _on_Jump_button_down():
	Input.action_press("ui_jump")

func _on_Land_button_down():
	Input.action_press("ui_land")

# Buttons up

func _on_Up_button_up():
	Pad.up = false
#	Input.action_release("ui_up")

func _on_Down_button_up():
	Input.action_release("ui_down")

func _on_Left_button_up():
	Input.action_release("ui_left")

func _on_Right_button_up():
	Input.action_release("ui_right")

func _on_Altm_button_up():
	Input.action_release("ui_alt-")

func _on_Pause_button_up():
	Input.action_release("ui_pause")

func _on_Jump_button_up():
	Input.action_release("ui_jump")

func _on_Altp_button_up():
	Input.action_release("ui_alt+")

func _on_Land_button_up():
	Input.action_release("ui_land")
