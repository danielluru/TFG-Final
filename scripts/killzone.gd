extends Area2D

@onready var timer: Timer = $Timer

func _on_body_entered(body):
	print("Has muerto")
	##body.get_node("CollisionShape2D").queue_free()
	timer.start() 

func _on_timer_timeout():
	get_tree().reload_current_scene()
	GameManager.score = 0
