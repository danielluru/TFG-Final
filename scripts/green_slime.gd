extends Node2D

const SPEED = 60
var direccion  = 1
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready():
	add_to_group("enemigos")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ray_cast_right.is_colliding():
		direccion = -1	
		animated_sprite.flip_h = true
	if ray_cast_left.is_colliding():
		direccion = 1	
		animated_sprite.flip_h = false
	
	position.x += direccion * SPEED * delta
func _on_pisoton_area_area_entered(area):
	if area.name == "RayCastAbajo":  # el Area2D debajo del jugador
		queue_free()  # Mata al enemigo
