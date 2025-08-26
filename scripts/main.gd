extends Control

@onready var visualizer = $ArrayVisualizer
@onready var sort_option = $VBoxContainer/SortOption
@onready var search_option = $SearchContainer/SearchOption
@onready var input_value = $SearchContainer/LineEdit
@onready var speed_slider = $VBoxContainer/SpeedSlider
@onready var play_pause_btn = $VBoxContainer/PlayPauseButton
@onready var next_btn = $VBoxContainer/NextButton
@onready var title: Label = $Title
@onready var search_title: Label = $searchTitle

var array: Array = []
var reboot_array: Array = []

func _ready():
	# Opciones iniciales
	Parameters.animation_speed = 1 - speed_slider.value
	Stepper.set_delay(1 - speed_slider.value)  # velocidad inicial
	title.text = sort_option.text
	search_title.text = search_option.text
	#search_option.add_item("Búsqueda Binaria")
	_on_generate_pressed()

func _on_generate_pressed():
	array = []
	for i in range(Parameters.vector_size):
		array.append(randi() % Parameters.max_value + 1)
	reboot_array = array.duplicate()
	visualizer.set_array(array)

func _on_sort_pressed():
	title.text = sort_option.text
	match sort_option.selected:
		0: await load("res://scripts/algorithms/bubblesort.gd").new().bubble_sort_step(array, visualizer)
		1: await load("res://scripts/algorithms/insertsort.gd").new().insertion_sort_step(array, visualizer)
		2: await load("res://scripts/algorithms/selectionsort.gd").new().selection_sort_step(array, visualizer)
		3: await load("res://scripts/algorithms/quicksort.gd").new().quicksort_step(array, visualizer)

func _on_speed_slider_value_changed(value: float) -> void:
	Parameters.animation_speed = 1 - value
	Stepper.set_delay(1 - value)

func _on_search_pressed():
	var value = input_value.text.to_int()
	search_title.text = search_option.text
	match search_option.selected:
		0: await load("res://scripts/algorithms/binary_search.gd").new().binary_search_step(array, visualizer, value)
		1: await load("res://scripts/algorithms/linear_search.gd").new().linear_search_step(array, visualizer, value)

func _on_PlayPauseBtn_pressed() -> void:
	Stepper.toggle_play()
	play_pause_btn.text =  "Pausar" if Stepper.playing else "Reanudar"

func _on_NextBtn_pressed() -> void:
	Stepper.next_step()

func generate_array() -> Array:
	var arr: Array = []
	for i in range(10):
		arr.append(randi() % 20 + 1)
	return arr

func _on_ResetBtn_pressed() -> void:
	# 1. Resetear Stepper a modo auto
	Stepper.set_playing(true)
	play_pause_btn.text =  "Pausar" if Stepper.playing else "Reanudar"

	# 2. Restaurar array inicial (o generar otro nuevo si querés aleatorio)
	#var reset_array = generate_array()  # o usa original_array si lo guardaste
	array = reboot_array.duplicate()

	# 3. Refrescar visualizador
	visualizer.set_array(array)
	visualizer.set_highlight([], Parameters.normalColor)

	# 4. (Opcional) detener cualquier corrutina previa
	get_tree().call_group_flags(SceneTree.GROUP_CALL_DEFAULT, "sorting_tasks", "queue_free")
