extends Area2D

@onready var game_manager = get_node("res://scripts/game_manager.gd")
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _on_body_entered(body):
	#game_manager.add_point()
	GameManager.add_point()
	animation_player.play("pickup")
