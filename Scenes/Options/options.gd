extends CanvasLayer

var result = Array()

onready var parent = get_node("letters")

var letters = Array()
var index = Array()


func _on_TextureButton_pressed():
	loading.goto_scene("res://Scenes/Menu/play_menu.tscn")
	pass # replace with function body
