extends TouchScreenButton
#change scene to menu
func _on_play_pressed():
	loading.goto_scene("res://Scenes/Menu/play_menu.tscn")
	pass # replace with function body