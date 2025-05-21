extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var raycast_abajo = $RayCastAbajo  # Un RayCast2D apuntando hacia abajo

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	#Get the input direction: -1, 0, 1
	var direction := Input.get_axis("move_left", "move_right")
	
	#Flip the Sprite
	if direction > 0:
		animated_sprite.flip_h = false
	elif  direction < 0:
		animated_sprite.flip_h = true
	
	# Play animations
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")
	
	# Aplly movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if raycast_abajo.is_colliding():
		var collider = raycast_abajo.get_collider()

		# Verifica si es un enemigo
		if collider.is_in_group("enemigos") and velocity.y > 0:
			collider.queue_free()  # Mata al enemigo
			velocity.y = -300  # Rebota hacia arriba

	move_and_slide()
