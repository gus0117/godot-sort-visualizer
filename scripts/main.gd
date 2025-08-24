extends Control

@onready var visualizer = $ArrayVisualizer
@onready var sort_option = $VBoxContainer/SortOption
#@onready var search_option = $VBoxContainer/OptionButton
#@onready var input_value = $VBoxContainer/LineEdit

var array: Array = []

func _ready():
	# Opciones iniciales
	Parameters.animation_speed = 1 - $VBoxContainer/HSlider.value
	sort_option.add_item("Bubble Sort")
	#search_option.add_item("Búsqueda Binaria")

func _on_generate_pressed():
	array = []
	for i in range(15):
		array.append(randi() % 20 + 1)
	visualizer.set_array(array)

func _on_sort_pressed():
	match sort_option.selected:
		0: await load("res://scripts/algorithms/bubblesort.gd").new().bubble_sort_step(array, visualizer)

func _on_speed_slider_value_changed(value: float) -> void:
	Parameters.animation_speed = 1-value

func _on_search_pressed():
	pass
	#var value = input_value.text.to_int()
	#match search_option.selected:
	#	0: await load("res://scripts/algorithms/binary_search.gd").new().binary_search_step(array, value, visualizer)
