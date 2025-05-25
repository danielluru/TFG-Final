extends CharacterBody2D


var SPEED = 130.0
var JUMP_VELOCITY = -300.0
var death = false
var vida = 3
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var zona_muerte: Area2D = $ZonaMuerte
@onready var timer: Timer = $Timer
@onready var player: CharacterBody2D = $"."
@onready var canvas_layer: CanvasLayer = $"../CanvasLayer"


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	if Input.is_action_just_pressed("dash") and is_on_floor():
		velocity.x = SPEED + 30
	#Get the input direction: -1, 0, 1
	var direction := Input.get_axis("move_left", "move_right")
	
	#Flip the Sprite
	if direction > 0:
		animated_sprite.flip_h = false
	elif  direction < 0:
		animated_sprite.flip_h = true
	
	# Play animations
	if is_on_floor():
		if direction == 0 and death == false:
			animated_sprite.play("idle")
		elif death == false :
			animated_sprite.play("run")
		elif (direction > 0 or direction < 0) and death == false:
			animated_sprite.play("dash")
	else:
		animated_sprite.play("jump")
	
	# Aplly movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func _on_zona_muerte_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemigos") and area.is_in_group("manolo"):
		velocity.y = -300 

func muerte():
	vida -= 1
	if vida == 0:
		death = true
		animated_sprite.play("death")
		timer.start(1)
		player.collision_mask = 2
		velocity.y = 0
		GameManager.score = 0
	elif vida == 2:
		canvas_layer.vida2()
	elif vida == 1:
		canvas_layer.vida1()

func curar():
	if vida == 2 or vida == 3:
		canvas_layer.vida3()
		if vida == 2:
			vida = 3
		
	elif vida == 1:
		canvas_layer.vida2()
		vida = 2

func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()


func _on_cuerpo_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemigos"):
		muerte()
	
	if area.is_in_group("cura"):
		curar()
		
	if area.is_in_group("portal"):
		print("Hola")
		SPEED = 0
		JUMP_VELOCITY = 0
