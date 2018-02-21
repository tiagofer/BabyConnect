extends Control



func _on_en_us_pressed():
	ad_control.language = 1
	get_node("btn_press").play("anim_us")


func _on_pt_br_pressed():
	ad_control.language = 0
	get_node("btn_press").play("anim_pt")
