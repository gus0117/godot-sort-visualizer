extends LineEdit

func _ready() -> void:
	virtual_keyboard_type = LineEdit.KEYBOARD_TYPE_NUMBER

func _on_text_changed(new_text: String) -> void:
	var filtered := ""
	for i in new_text.length():
		var codepoint = new_text.unicode_at(i)
		if codepoint >= 48 and codepoint <= 57: # '0' (48) a '9' (57)
			filtered += new_text[i]
	if new_text != filtered:
		text = filtered
