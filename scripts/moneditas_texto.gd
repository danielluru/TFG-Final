extends Label

@onready var game_manager = get_node("res://scripts/game_manager.gd")

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	text = str(GameManager.score) + " de " + str(GameManager.levelCoins)
