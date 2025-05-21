extends Node
@onready var score_label: Label = $ScoreLabel

var score = 0
var totalCoins = 22

func add_point():
	score += 1
	score_label.text = "Tu tienes " + str(score) + " monedas de " + str(totalCoins)
	if score == totalCoins:
		score_label.text = "ENHORABUENA. ¡¡¡HAS CONSEGUIDO TODAS LAS MONEDAS!!!"
