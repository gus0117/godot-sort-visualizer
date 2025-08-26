extends Node

func selection_sort_step(array: Array, visualizer: Node2D) -> void:
	var n = array.size()

	for i in range(n - 1):
		var min_index = i

		# 🔹 Resaltar el inicio de la nueva iteración
		if "set_highlight" in visualizer:
			visualizer.set_highlight([i], Parameters.newIteration)
		await Stepper.wait()

		# Buscar el mínimo en el subarray restante
		for j in range(i + 1, n):
			if "set_highlight" in visualizer:
				visualizer.set_highlight([min_index, j], Parameters.comparasionColor)
			await Stepper.wait()

			if array[j] < array[min_index]:
				min_index = j
				if "set_highlight" in visualizer:
					visualizer.set_highlight([i, min_index], Color.ORANGE)
				await Stepper.wait()

		# Si se encontró un nuevo mínimo, hacer el swap
		if min_index != i:
			if "set_highlight" in visualizer:
				visualizer.set_highlight([i, min_index], Parameters.swapColor)
			await Stepper.wait()

			var temp = array[i]
			array[i] = array[min_index]
			array[min_index] = temp

			if "set_array" in visualizer:
				visualizer.set_array(array)
			await Stepper.wait()

		# 🔹 Marcar el elemento en su posición final como verde
		if "set_highlight" in visualizer:
			visualizer.set_highlight([i], Parameters.finalColor)
		await Stepper.wait()

	# Marcar el último elemento como verde (ya ordenado)
	if "set_highlight" in visualizer:
		visualizer.set_highlight([n - 1], Parameters.finalColor)
	if "set_array" in visualizer:
		visualizer.set_array(array)
