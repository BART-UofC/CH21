extends Control



func _on_NewGameButton_pressed() -> void:
	get_tree().change_scene("res://src/Levels/LevelManitoba.tscn")


func _on_ContinueButton_pressed() -> void:
	get_tree().change_scene("res://src/Levels/LevelManitoba.tscn")
	


func _on_ExitButton_pressed() -> void:
	get_tree().quit()


func _ready():
	AudioController.play_music()
	
