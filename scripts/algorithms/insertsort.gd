# res://scripts/algorithms/insertion_sort.gd
extends Node

func insertion_sort_step(array: Array, visualizer: Node2D) -> void:
	var n = array.size()

	for i in range(1, n):
		var key = array[i]
		var j = i - 1

		# 🔹 Mostrar el "key" (elemento actual) en cyan
		if "set_highlight" in visualizer:
			visualizer.set_highlight([i], Parameters.newIteration)
			#visualizer.set_highlight([i])
		await Stepper.wait()

		# 🔹 Desplazar hacia la derecha mientras haya elementos mayores que key
		while j >= 0 and array[j] > key:
			if "set_highlight" in visualizer:
				visualizer.set_highlight([j, j+1], Parameters.comparasionColor)
				#visualizer.set_highlight([j, j+1])
			await Stepper.wait()

			array[j + 1] = array[j]   # mover a la derecha
			if "set_array" in visualizer:
				visualizer.set_array(array)
			await Stepper.wait()

			j -= 1

		# 🔹 Insertar el key en su posición correcta
		array[j + 1] = key
		if "set_array" in visualizer:
			visualizer.set_array(array)
		if "set_highlight" in visualizer:
			visualizer.set_highlight([j+1], Color.ORANGE)
			#visualizer.set_highlight([j+1])
		await Stepper.wait()

		# 🔹 Marcar en verde todos los ya ordenados hasta i
		if "set_highlight" in visualizer:
			var ordered = []
			for k in range(i+1):
				ordered.append(k)
			visualizer.set_highlight(ordered, Parameters.finalColor)
			#visualizer.set_highlight(ordered)
		await Stepper.wait()

	# 🔹 Marcar todo en verde al final
	if "set_highlight" in visualizer:
		var all = []
		for k in range(n):
			all.append(k)
		visualizer.set_highlight(all, Parameters.finalColor)
		#visualizer.set_highlight(all)
