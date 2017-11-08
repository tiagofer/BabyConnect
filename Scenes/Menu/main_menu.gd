extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var admob = null
var admob_banner_id = "ca-app-pub-6404552898440853/1679268287"
var admob_inter_id = "ca-app-pub-6404552898440853/6733952711"
var root
var current_scene

func _ready():
	root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() -1)
	printt(admob)
	
	if (Globals.has_singleton("bbAdmob")):
		admob = Globals.get_singleton("bbAdmob")
		admob.init_admob_banner_test(get_instance_ID(), admob_banner_id, false)
		admob.init_admob_test(get_instance_ID(), admob_banner_id, admob_inter_id, false)
	
	if (admob != null):
		admob.show_banner()

func _on_btn_connect_pressed():
	if (admob != null):
		admob.hide_banner()
	loading.goto_scene("res://Scenes/Gameplay/GameConnect/main_connect.tscn")
	pass # replace with function body

func _on_btn_memory_pressed():
	if (admob != null):
		admob.hide_banner()
	loading.goto_scene("res://Scenes/Gameplay/ConnectAnimals/main_animals.tscn")
	pass # replace with function body


func _on_TextureButton_pressed():
	loading.goto_scene("res://Scenes/Options/options.tscn")
	pass # replace with function body
