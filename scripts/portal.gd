extends Node2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var espera: Timer = $Espera
@onready var label: Label = $Label
@onready var espera_final: Timer = $EsperaFinal
@onready var moneditas_texto: Label = $"../CanvasLayer/MoneditasTexto"

func cambioEscena():
	get_tree().change_scene_to_file("res://scenes/mundo" + str(int(get_tree().current_scene.name) +1) + ".tscn")


func _on_entrar_portal_area_entered(area: Area2D) -> void:
	if area.is_in_group("cuerpo"):
		animation_player.play("cambioMapa")
		espera.start(3)
		espera_final.start(5)

func _on_espera_final_timeout() -> void:
	cambioEscena()
	moneditas_texto.text = "0 de 20"
	GameManager.score = 0

func _on_espera_timeout() -> void:
	label.visible = true
