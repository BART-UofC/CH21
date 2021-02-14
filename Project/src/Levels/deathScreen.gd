extends Control

var player: = find_node("Player")

func _ready():
	#play sound here
	pass

func _input(event):
	if event.is_action_pressed("quit"):
		get_tree().quit()
	if event.is_action_pressed("restart"):
		var prevScene: = "src/Levels/" + Global.currentScene + ".tscn"
		print("Changing to: " + prevScene)
		get_tree().change_scene(prevScene)
