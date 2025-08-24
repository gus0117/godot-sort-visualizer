extends Node

func bubble_sort_step(array: Array, visualizer: Node) -> void:
	var n = array.size()
	for i in range(n):
		for j in range(0, n - i - 1):
			visualizer.set_highlight([j, j+1])
			await Engine.get_main_loop().create_timer(Parameters.animation_speed).timeout
			if array[j] > array[j + 1]:
				var temp = array[j]
				array[j] = array[j + 1]
				array[j + 1] = temp
				visualizer.set_array(array)
	visualizer.set_highlight([])
	visualizer.set_array(array)
