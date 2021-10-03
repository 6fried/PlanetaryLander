extends Control

var nodes = {
	1:$Base,
	2:$Step1,
	3:$Step2,
	4:$Step3,
#	5:"",
#	6:"",
}

var node_value = 1

func _on_Next_pressed():
	node_value += 1
	for node in nodes.values():
		node.hide()
	nodes[node_value].show()

func _on_Prev_pressed():
	node_value -= 1
	for node in nodes.values():
		node.hide()
	nodes[node_value].show()
