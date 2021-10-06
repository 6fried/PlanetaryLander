extends CanvasLayer



func _on_Up_button_down():
	Pad.up = true

func _on_Down_button_down():
	Pad.down = true

func _on_Left_button_down():
	Pad.left = true

func _on_Right_button_down():
	Pad.right = true

func _on_Pause_button_down():
	Pad.pause = true

func _on_Altp_button_down():
	Pad.altp = true

func _on_Altm_button_down():
	Pad.altm = true

func _on_Jump_button_down():
	Pad.jump = true

func _on_Up_button_up():
	Pad.up = false

func _on_Down_button_up():
	Pad.down = false

func _on_Left_button_up():
	Pad.left = false

func _on_Right_button_up():
	Pad.right = false

func _on_Altm_button_up():
	Pad.altm = false

func _on_Pause_button_up():
	Pad.pause = false

func _on_Jump_button_up():
	Pad.jump = false

func _on_Altp_button_up():
	Pad.altp = false
