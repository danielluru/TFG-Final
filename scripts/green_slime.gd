extends Node2D

var SPEED = 60
var direccion  = 1
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var killzone: Area2D = $ZonaMuerte
@onready var timer: Timer = $Timer
@onready var pisoton_area: Area2D = $PisotonArea
@onready var manolo: CollisionShape2D = $PisotonArea/manolo

func _on_pisoton_area_area_entered(area: Area2D) -> void:
	if area.name == "ZonaMuerte":  # el Area2D debajo del jugador
		animated_sprite.play("death")
		manolo.disabled = true
		timer.start(0.4)
		SPEED = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ray_cast_right.is_colliding():
		direccion = -1	
		animated_sprite.flip_h = true
	if ray_cast_left.is_colliding():
		direccion = 1	
		animated_sprite.flip_h = false
	
	position.x += direccion * SPEED * delta	

func _on_timer_timeout() -> void:
	queue_free()
	

##func _on_zona_muerte_body_entered(body: Node2D) -> void:
	##print("Has muerto")
	##Engine.time_scale = 0.5
	##body.get_node("CollisionShapeIzq").queue_free()
	##body.get_node("CollisionShapeDe").queue_free()
	##timer.start() 
