extends Node2D
@onready var score_label: Label = $ScoreLabel

var score = 19
var levelCoins = 20

func add_point():
	score += 1
	##score_label.text = str(score) + " de " + str(levelCoins)
	#if score == levelCoins:
	#	score = 0
