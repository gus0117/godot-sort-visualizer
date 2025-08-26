# res://scripts/algorithms/linear_search.gd
extends Node

func linear_search_step(array: Array, visualizer: Node2D, target: int) -> int:
	var n = array.size()

	for i in range(n):
		# 🔹 Resaltar comparación actual
		if "set_highlight" in visualizer:
			visualizer.set_highlight([i], Parameters.comparasionColor)
			#visualizer.set_highlight([i])
		await Stepper.wait()

		if array[i] == target:
			# 🔹 Si se encuentra, marcar en verde
			if "set_highlight" in visualizer:
				visualizer.set_highlight([i], Parameters.finalColor)
				#visualizer.set_highlight([i])
			await Stepper.wait()
			return i

	# 🔹 Si no se encontró, marcar todo en rojo
	if "set_highlight" in visualizer:
		var all_indices = []
		for j in range(n):
			all_indices.append(j)
		visualizer.set_highlight(all_indices, Parameters.notFound)
		#visualizer.set_highlight(all_indices)
	await Stepper.wait()

	return -1
