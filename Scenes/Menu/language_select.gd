extends Control



func _on_pt_br_pressed():
	ad_control.language = 0
	get_parent().hide()
	pass # replace with function body


func _on_en_us_pressed():
	ad_control.language = 1
	get_parent().hide()
	pass # replace with function body
