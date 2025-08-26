# res://scripts/algorithms/bubblesort.gd
extends Node

func bubble_sort_step(array: Array, visualizer: Node2D) -> void:
	var n = array.size()
	for i in range(n):
		for j in range(0, n - i - 1):
			# 1) Mostrar comparación
			if "set_highlight" in visualizer:
				visualizer.set_highlight([j, j + 1], Parameters.comparasionColor)
			await Stepper.wait()

			# 2) Si hay intercambio, resaltarlo y ejecutar
			if array[j] > array[j + 1]:
				if "set_highlight" in visualizer:
					visualizer.set_highlight([j, j + 1], Parameters.swapColor)
				await Stepper.wait()

				var tmp = array[j]
				array[j] = array[j + 1]
				array[j + 1] = tmp
				if "set_array" in visualizer:
					visualizer.set_array(array)
				await Stepper.wait()

		# (Opcional) marcar el último como “fijo” en verde
		if "set_highlight" in visualizer:
			visualizer.set_highlight([n - i - 1], Parameters.finalColor)
		await Stepper.wait()

	# Limpieza final
	if "set_highlight" in visualizer:
		visualizer.set_highlight([], Parameters.finalColor)
	if "set_array" in visualizer:
		visualizer.set_array(array)
