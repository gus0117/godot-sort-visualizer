extends Node2D

# Arrays
var array: Array = []
var highlight: Dictionary = {} # {indice: color}

# settings
var bar_width: int = 40
var bar_spacing: int = 5
var base_y: int = 550 # 350 original
var font := ThemeDB.fallback_font
var height_scale = 20

#Colors


func set_array(new_array: Array) -> void:
	array = new_array
	queue_redraw()

func set_highlight(indexs: Array, color: Color) -> void:
	highlight.clear()
	for i in indexs:
		highlight[i] = color
	queue_redraw()

func _draw() -> void:
	
	# ancho total del gráfico
	var width = bar_width + bar_spacing
	var total_width = array.size() * width
	# offset para centrar (asumiendo que tu ventana mide 800px de ancho)
	var screen_width = get_viewport_rect().size.x
	var offset_x = (screen_width - total_width) / 2
	
	for i in range(array.size()):
		var height = array[i] * 10
		
		var x = offset_x + i * width   # desplazado al centro
		var y = base_y - height
		
		# Colores
		var bar_color = Parameters.normalColor
		var text_color = Color(0.8, 0.9, 1) # celeste claro
		
		if highlight.has(i):
			bar_color = highlight[i]
			text_color = highlight[i]
		
		#ORIGINAL
		#if i in highlight:
		#	bar_color = Color.YELLOW
		#	text_color = Color.YELLOW

		# Dibujar barra
		#draw_rect(Rect2(i * width, base_y - height, width - 5, height), bar_color)
		draw_rect(Rect2(x, y, width - 5, height), bar_color)

		# Dibujar valor arriba de la barra
		#draw_string(font, Vector2(i * width + 5, base_y - height - 5), str(array[i]), 0, -1, 16, Color(0.8, 0.9, 1))
		#draw_string(font, Vector2(x + 5, y - 5), str(array[i]), 0, -1, 16, text_color)
		draw_string(font, Vector2(x + bar_width/2 - bar_spacing, y - 5), str(array[i]), 0, -1, 16, text_color)
		
		# Dibujar índice debajo de la barra
		#draw_string(font, Vector2(i * width + 5, base_y + 20), str(i),0, -1, 16, text_color)
		draw_string(font, Vector2(x + bar_width/2 - bar_spacing, base_y + 20), str(i),0, -1, 16, text_color)
