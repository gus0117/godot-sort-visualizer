# res://scripts/Stepper.gd
extends Node

var playing: bool = true       # animación automática
var step_pressed: bool = false # avanzar un paso manualmente
var paused: bool = false       # pausa lógica: congela la animacion pero la UI sigue viva
var animation_speed: float = 0.5

func set_delay(value: float) -> void:
	animation_speed = value

func toggle_play() -> void:
	playing = !playing
	paused = !paused

func next_step() -> void:
	playing = false
	paused = false
	step_pressed = true

func reset() -> void:
	playing = true
	step_pressed = false
	paused = false

func wait():
	# Si está en pausa → esperar hasta que se reanude
	while paused:
		await get_tree().process_frame

	if playing:
		# Avanzar automáticamente con delay
		return await get_tree().create_timer(animation_speed, false, true).timeout
	else:
		# Modo paso a paso
		while not step_pressed:
			await get_tree().process_frame
	step_pressed = false
	return
