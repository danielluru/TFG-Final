extends CanvasLayer

@onready var corazon_0: AnimatedSprite2D = $Corazon0
@onready var corazon_1: AnimatedSprite2D = $Corazon1
@onready var corazon_2: AnimatedSprite2D = $Corazon2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func vida1():
	print("Vidas 1")
	corazon_1.visible = false
	corazon_2.visible = false
	pass

func vida2():
	print("Vidas 2")
	corazon_1.visible = false
	corazon_2.visible = true
	pass

func vida3():
	print("Vidas 3")
	corazon_1.visible = true
	corazon_2.visible = true
	corazon_0.visible = true
	pass
