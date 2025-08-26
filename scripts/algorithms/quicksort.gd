# res://scripts/algorithms/quicksort.gd
extends Node

func quicksort_step(array: Array, visualizer: Node2D, low: int = 0, high: int = -1) -> void:
	if high == -1:
		high = array.size() - 1

	if low < high:
		var p = await partition(array, visualizer, low, high)
		await quicksort_step(array, visualizer, low, p - 1)
		await quicksort_step(array, visualizer, p + 1, high)

# 🔹 Partición de Lomuto
func partition(array: Array, visualizer: Node2D, low: int, high: int) -> int:
	var pivot = array[high]
	var i = low - 1

	# 🔹 Marcar pivote en cyan
	if "set_highlight" in visualizer:
		#visualizer.set_highlight([high], Color.CYAN)
		visualizer.set_highlight([high])
	await Stepper.wait()

	for j in range(low, high):
		# 🔹 Comparación en amarillo
		if "set_highlight" in visualizer:
			#visualizer.set_highlight([j, high], Color.YELLOW)
			visualizer.set_highlight([j, high])
		await Stepper.wait()

		if array[j] <= pivot:
			i += 1
			if i != j:
				# 🔹 Intercambio en rojo
				if "set_highlight" in visualizer:
					#visualizer.set_highlight([i, j], Color.RED)
					visualizer.set_highlight([i, j])
				await Stepper.wait()

				var temp = array[i]
				array[i] = array[j]
				array[j] = temp

				if "set_array" in visualizer:
					visualizer.set_array(array)
				await Stepper.wait()

	# Colocar pivote en su lugar
	if i + 1 != high:
		if "set_highlight" in visualizer:
			#visualizer.set_highlight([i + 1, high], Color.MAGENTA)
			visualizer.set_highlight([i + 1, high])
		await Stepper.wait()

		var temp2 = array[i + 1]
		array[i + 1] = array[high]
		array[high] = temp2

		if "set_array" in visualizer:
			visualizer.set_array(array)
		await Stepper.wait()

	# 🔹 Marcar posición final del pivote como verde
	if "set_highlight" in visualizer:
		#visualizer.set_highlight([i + 1], Color.GREEN)
		visualizer.set_highlight([i + 1])
	await Stepper.wait()

	return i + 1
