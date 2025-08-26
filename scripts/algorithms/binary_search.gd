extends Node
'''
func binary_search_step(array: Array, value: int, visualizer: Node) -> void:
	var inicio = 0
	var fin = array.size() - 1

	while inicio <= fin:
		var medio = (inicio + fin) / 2
		visualizer.draw_array(array, [medio])
		await get_tree().create_timer(0.5).timeout

		if array[medio] == value:
			visualizer.draw_array(array, [medio])
			return
		elif array[medio] < value:
			inicio = medio + 1
		else:
			fin = medio - 1
'''

func binary_search_step(array: Array, visualizer: Node2D, value: int) -> void:
	var lo = 0
	var hi = array.size() - 1

	while lo <= hi:
		var mid = (lo + hi) >> 1
		if "set_highlight" in visualizer:
			visualizer.set_highlight([mid]) # Color.YELLEW
		await Stepper.wait()

		if array[mid] == value:
			if "set_highlight" in visualizer:
				visualizer.set_highlight([mid]) # Color.GREEN
			await Stepper.wait()
			return
		elif array[mid] < value:
			lo = mid + 1
		else:
			hi = mid - 1
