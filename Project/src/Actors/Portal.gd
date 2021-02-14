extends Actor

export var nextLevel = ""

func _on_Area2D_body_entered(body: Node) -> void:
	if body.name == "Player":
		print(nextLevel)
		get_tree().change_scene(nextLevel)
