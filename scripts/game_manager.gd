extends Node2D
@onready var score_label: Label = $ScoreLabel

var score = 0
var level1 = 22


func add_point():
	score += 1
	score_label.text = str(score) + " de " + str(level1)
	if score == level1:
		get_tree().change_scene_to_file("res://scenes/level_1.tscn")
		score = 0
		var level2 = 30
		
