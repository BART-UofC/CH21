extends Node


var backroundMusic = load("res://Sound/mountain-trials.ogg")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func play_music():
	$Audio.stream = backroundMusic
	$Audio.play()
