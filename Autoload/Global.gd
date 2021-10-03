extends Node

var current_scene = null
var root = null
var altitude = 1000
var coin = false

func goto_scene(path):
	root = get_tree().get_root()
#	root = root.get_child(root.get_child_count()-1)
	current_scene = root.get_child(root.get_child_count() - 1)
	call_deferred("_deferred_goto_scene", path)

func _deferred_goto_scene(path):
	current_scene.free()
	var s = ResourceLoader.load(path)
	current_scene = s.instance()
	root.add_child(current_scene)
	get_tree().set_current_scene(current_scene)


func lose():
	pass

func win():
	pass
