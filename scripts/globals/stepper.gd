# res://scripts/Stepper.gd
extends Node

var playing: bool = true        # true = reproduce automático, false = modo paso a paso
var delay: float = 0.3          # retraso entre pasos cuando está "playing"
var _sem := Semaphore.new()     # para liberar "un paso" cuando está pausado

func set_delay(value: float) -> void:
	delay = max(0.0, value)

func set_playing(value: bool) -> void:
	playing = value
	if playing:
		# Reiniciamos el semáforo para descartar clics de “Siguiente” acumulados
		_sem = Semaphore.new()

func toggle_play() -> void:
	set_playing(!playing)

func next_step() -> void:
	# Libera exactamente un "paso" cuando está en pausa
	_sem.post()

func wait() -> void:
	# Punto de sincronización para los algoritmos: comparación, intercambio, etc.
	if playing:
		await Engine.get_main_loop().create_timer(delay).timeout
	else:
		# Esperar paso sin congelar la UI
		while _sem.try_wait() == false:
			await get_tree().process_frame
		# Deja respirar siempre al motor
		await get_tree().process_frame
