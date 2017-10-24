extends TouchScreenButton

var is_touched

func _input(event):
	if event.type == InputEvent.SCREEN_DRAG:
		if is_touched:
			set_pos(event.pos)



func _on_letter_container_pressed():
	is_touched = true
	pass # replace with function body


func _on_letter_container_released():
	is_touched = false
	pass # replace with function body
