extends Control



func _ready() -> void:
	$VBoxContainer/Inicio.grab_focus()

func _on_inicio_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/mundo1.tscn")


func _on_salir_del_juego_pressed() -> void:
	get_tree().quit()
