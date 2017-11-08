extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var stars = preload("res://Scenes/Gameplay/GameConnect/Containers/star_victory.tscn")
 

func _ready():
	set_process(true)
	pass

func _process(delta):
	if (global.score==3):
		var temp = stars.instance()
		add_child(temp)
		temp.get_child(3).play("show_stars")
		global.score+=1
 

 