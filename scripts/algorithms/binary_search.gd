extends Node

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
