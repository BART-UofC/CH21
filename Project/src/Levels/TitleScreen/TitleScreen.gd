extends Control



func _on_NewGameButton_pressed() -> void:
	get_tree().change_scene("res://src/Levels/Manitoba.tscn")


func _on_ContinueButton_pressed() -> void:
	get_tree().change_scene("res://src/Levels/Manitoba.tscn")
	


func _on_ExitButton_pressed() -> void:
	get_tree().quit()
