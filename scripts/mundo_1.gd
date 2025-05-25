extends Node2D

@onready var portal: Node2D = $Portal

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if GameManager.score == GameManager.levelCoins:
		portal.visible = true
