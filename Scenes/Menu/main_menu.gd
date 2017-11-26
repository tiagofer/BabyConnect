extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var root
var current_scene

var admob = null
var isReal = false
var adBannerId = "ca-app-pub-6404552898440853/5390074708"
var chartboost

func _ready():
	printt(global.score)
	root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() -1)
	if (Globals.has_singleton("AdMob")):
		admob = Globals.get_singleton("AdMob")
		admob.init(isReal, get_instance_ID(),true)
		loadBanner()
	if(Globals.has_singleton("MamauChartboost")):
		chartboost = Globals.get_singleton("MamauChartboost")
		chartboost.init(Globals.get("mamau_chartboost/app_id"), Globals.get("mamau_chartboost/app_signature"))
	if(chartboost != null and ad_control.count_interstitial >= 4):
		printt("loaded...")
		chartboost.show_interstitial()
		ad_control.count_interstitial = 0

func _on_btn_connect_pressed():
	if (admob != null):
		admob.hideBanner()
	loading.goto_scene("res://Scenes/Gameplay/GameConnect/main_connect.tscn")
	pass # replace with function body

func _on_btn_memory_pressed():
	if (admob != null):
		admob.hideBanner()
	loading.goto_scene("res://Scenes/Gameplay/ConnectAnimals/main_animals.tscn")
	pass # replace with function body


func _on_TextureButton_pressed():
	loading.goto_scene("res://Scenes/Options/options.tscn")
	pass # replace with function body

func loadBanner():
	if (admob != null):
		printt("loading...")
		admob.loadBanner(adBannerId,false,true)
