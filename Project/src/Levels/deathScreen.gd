extends Control

func _input(event):
	if event.is_action_pressed("quit"):
		get_tree().quit()
	if event.is_action_pressed("restart"):
		var prevScene: = "src/Levels/" + Global.currentScene + ".tscn"
		get_tree().change_scene(prevScene)
