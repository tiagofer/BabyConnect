extends Node

var save_file = File.new()
var save_path = "user://scoreletter8.save"
var save_data = Array()
var was_played = 0

onready var canvas_language = get_node("/root/main_menu/language_select")

func _ready():
	if not save_file.file_exists(save_path):
		create_save()
	elif global.score >= 0:
		update()
	_calculate_score()
	_check_tutorial()

func create_save():
	for i in range(23):
		save_data.append(0)
	save_file.open(save_path, File.WRITE)
	save_file.store_var(save_data)
	save_file.store_16(was_played)
#	printt(save_data)
	save_file.close()

func save():
#	print (save_data)
	save_file.open(save_path, File.WRITE)
	save_file.store_var(save_data)
	save_file.store_16(was_played)
	save_file.close()

func read():
	save_file.open(save_path, File.READ)
	save_data = save_file.get_var()
	was_played = save_file.get_16()
	save_file.close()

func update():
	read()
#	printt(save_data)
	if (ad_control.score.size() > 0 and ad_control.is_played):
		for i in range(ad_control.score.size()):
			save_data[i] += ad_control.score[i]
			ad_control.score[i] = 0
		save()
	ad_control.is_played = false

func _calculate_score():
	for i in range(ad_control.score.size()):
		ad_control.score[i] = ad_control.correct[i] - ad_control.error[i]
		ad_control.correct[i] = 0
		ad_control.error[i] = 0
#		printt(ad_control.score[i])

func _check_tutorial():
	read()
	if was_played == 0:
		canvas_language.show()
		was_played = 1
		save()