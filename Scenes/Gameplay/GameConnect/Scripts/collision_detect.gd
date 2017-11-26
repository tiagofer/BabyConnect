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
		_correct_calc(area)
		pos_1.show()
		sound.play()
		anim.play("show_pos1")
		global.score+=1
		area.get_parent().queue_free()
		queue_free()
	else:
		_error_calc(area)
		_goto_initial_pos(area)
	pass # replace with function body


func _on_pos_2_area_enter( area ):
	if (area.is_in_group("pos_2")):
		_correct_calc(area)
		pos_2.show()
		sound.play()
		anim.play("show_pos2")
		global.score+=1
		area.get_parent().queue_free()
		queue_free()
	else:
		_error_calc(area)
		_goto_initial_pos(area)
	pass # replace with function body


func _on_pos_3_area_enter( area ):
	if (area.is_in_group("pos_3")):
		_correct_calc(area)
		pos_3.show()
		sound.play()
		anim.play("show_pos3")
		global.score+=1
		area.get_parent().queue_free()
		queue_free()
	else:
		_error_calc(area)
		_goto_initial_pos(area)
	pass # replace with function body

#get the texture on collisor and find index in the lettercompare array
#increment error array with the index
func _error_calc(var area):
	if (area.get_parent()).get_parent().get_name() == "letter_container":
		var index = ad_control.lettercompare.find(area.get_parent().get_texture())
		ad_control.error[index]+=1


func _correct_calc(var area):
	if (area.get_parent()).get_parent().get_name() == "letter_container":
		var index = ad_control.lettercompare.find(area.get_parent().get_texture())
		ad_control.correct[index]+=1
		
func _goto_initial_pos(var area):
	if area.is_in_group("pos_1"):
		area.get_parent().set_pos(ad_control.pos_1)
	elif area.is_in_group("pos_2"):
		area.get_parent().set_pos(ad_control.pos_2)
	else:
		area.get_parent().set_pos(ad_control.pos_3)
	area.get_parent().set("is_touched", false)

