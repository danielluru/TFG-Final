extends Node2D
@onready var score_label: Label = $ScoreLabel

var score = 0
var levelCoins = 20

func add_point():
	score += 1
	print(str(score))
	##score_label.text = str(score) + " de " + str(levelCoins)
	if score == levelCoins:
		##get_tree().change_scene_to_file("res://scenes/level_1.tscn")
		get_tree().change_scene_to_file("res://scenes/mundo" + str(int(get_tree().current_scene.name) +1) + ".tscn")
