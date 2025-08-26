extends Node

'''
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
'''

func selection_sort_step(array: Array, visualizer: Node2D) -> void:
	var n = array.size()

	for i in range(n - 1):
		var min_index = i

		# 🔹 Resaltar el inicio de la nueva iteración
		if "set_highlight" in visualizer:
			visualizer.set_highlight([i])
		await Stepper.wait()

		# Buscar el mínimo en el subarray restante
		for j in range(i + 1, n):
			if "set_highlight" in visualizer:
				visualizer.set_highlight([min_index, j])
			await Stepper.wait()

			if array[j] < array[min_index]:
				min_index = j
				if "set_highlight" in visualizer:
					visualizer.set_highlight([i, min_index])
				await Stepper.wait()

		# Si se encontró un nuevo mínimo, hacer el swap
		if min_index != i:
			if "set_highlight" in visualizer:
				visualizer.set_highlight([i, min_index])
			await Stepper.wait()

			var temp = array[i]
			array[i] = array[min_index]
			array[min_index] = temp

			if "set_array" in visualizer:
				visualizer.set_array(array)
			await Stepper.wait()

		# 🔹 Marcar el elemento en su posición final como verde
		if "set_highlight" in visualizer:
			visualizer.set_highlight([i])
		await Stepper.wait()

	# Marcar el último elemento como verde (ya ordenado)
	if "set_highlight" in visualizer:
		visualizer.set_highlight([n - 1])
	if "set_array" in visualizer:
		visualizer.set_array(array)
