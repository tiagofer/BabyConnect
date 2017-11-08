extends Node2D

onready var pos_1 = get_node("/root/Control/container/pos_1")
onready var pos_2 = get_node("/root/Control/container/pos_2")
onready var pos_3 = get_node("/root/Control/container/pos_3")

var anim
var sound

func _ready():
	anim = get_node("/root/Control/container/unions")
	sound = get_node("/root/Control/container/congrats")
	pass

func _on_pos_1_area_enter( area ):
	if (area.is_in_group("pos_1")):
		pos_1.show()
		sound.play()
		anim.play("show_pos1")
		global.score+=1
		area.get_parent().queue_free()
		queue_free()
	else:
		_error_calc(area)
	pass # replace with function body


func _on_pos_2_area_enter( area ):
	if (area.is_in_group("pos_2")):
		pos_2.show()
		sound.play()
		anim.play("show_pos2")
		global.score+=1
		area.get_parent().queue_free()
		queue_free()
	else:
		_error_calc(area)
	pass # replace with function body


func _on_pos_3_area_enter( area ):
	if (area.is_in_group("pos_3")):
		pos_3.show()
		sound.play()
		anim.play("show_pos3")
		global.score+=1
		area.get_parent().queue_free()
		queue_free()
	else:
		_error_calc(area)
	pass # replace with function body

#get the texture on collisor and find index in the lettercompare array
#increment error array with the index
func _error_calc(var area):
	var index = ad_control.lettercompare.find(area.get_parent().get_texture())
	ad_control.error[index]+=1
	printt(ad_control.error)