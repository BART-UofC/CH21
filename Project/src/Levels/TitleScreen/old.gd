extends Control


func _on_NewGameButton_pressed() -> void:
	print("Yes")
	get_tree().change_scene("res://src/Levels/Alberta.tscn")
