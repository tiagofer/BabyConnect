extends Control

#CONTAINERS NODES
onready var letter1 = get_node("letter_container/pos_1")
onready var letter2 = get_node("letter_container/pos_2")
onready var letter3 = get_node("letter_container/pos_3")

onready var obj1 = get_node("object_container/pos_1").get_child(1)
onready var obj2 = get_node("object_container/pos_2").get_child(1)
onready var obj3 = get_node("object_container/pos_3").get_child(1)


onready var pos_1 = get_node("/root/Control/container/pos_1")
onready var pos_2 = get_node("/root/Control/container/pos_2")
onready var pos_3 = get_node("/root/Control/container/pos_3")

#var letters = Array()
var generic_obj = Array()
var unions = Array()
var lettters = [ 
	"res://Assets/Sprites/Letters/abacaxi.png",
	"res://Assets/Sprites/Letters/boneca.png",
	"res://Assets/Sprites/Letters/casa.png",
	"res://Assets/Sprites/Letters/dinossauro.png",
	"res://Assets/Sprites/Letters/elephant.png",
	"res://Assets/Sprites/Letters/flor.png",
	"res://Assets/Sprites/Letters/gato.png",
	"res://Assets/Sprites/Letters/hipopotamo.png",
	"res://Assets/Sprites/Letters/indio.png",
	"res://Assets/Sprites/Letters/joaninha.png",
	"res://Assets/Sprites/Letters/ketchup.png",
	"res://Assets/Sprites/Letters/leao.png",
	"res://Assets/Sprites/Letters/melancia.png",
	"res://Assets/Sprites/Letters/navio.png",
	"res://Assets/Sprites/Letters/ovo.png",
	"res://Assets/Sprites/Letters/pinguim.png",
	"res://Assets/Sprites/Letters/queijo.png",
	"res://Assets/Sprites/Letters/R.png",
	"res://Assets/Sprites/Letters/S.png",
	"res://Assets/Sprites/Letters/T.png",
	"res://Assets/Sprites/Letters/uva.png",
	"res://Assets/Sprites/Letters/V.png",
	"res://Assets/Sprites/Letters/Z.png"
	]



var en_obj =  [
  "res://Assets/Sprites/Elements_EN/apple.png",
  "res://Assets/Sprites/Elements_EN/bear.png",
  "res://Assets/Sprites/Elements/gato.png",
  "res://Assets/Sprites/Elements/dinossauro.png",
  "res://Assets/Sprites/Elements/elephant.png",
  "res://Assets/Sprites/Elements/flor.png",
  "res://Assets/Sprites/Elements/uva.png",
  "res://Assets/Sprites/Elements/hipopotamo.png",
  "res://Assets/Sprites/Elements/indio.png",
  "res://Assets/Sprites/Elements_EN/jackfruit.png",
  "res://Assets/Sprites/Elements/ketchup.png",
  "res://Assets/Sprites/Elements/leao.png",
  "res://Assets/Sprites/Elements_EN/mouse.png",
  "res://Assets/Sprites/Elements_EN/nectarine.png",
  "res://Assets/Sprites/Elements_EN/orange.png",
  "res://Assets/Sprites/Elements/pinguim.png",
  "res://Assets/Sprites/Elements_EN/quince.png",
  "res://Assets/Sprites/Elements_EN/umbrela.png"
  ]
var en_union = ["res://Assets/Sprites/Unions_EN/apple.png",
  "res://Assets/Sprites/Unions_EN/bear.png",
  "res://Assets/Sprites/UnionsLetters/gato.png",
  "res://Assets/Sprites/UnionsLetters/dinossauro.png",
  "res://Assets/Sprites/UnionsLetters/elephant.png",
  "res://Assets/Sprites/UnionsLetters/flor.png",
  "res://Assets/Sprites/UnionsLetters/uva.png",
  "res://Assets/Sprites/UnionsLetters/hipopotamo.png",
  "res://Assets/Sprites/UnionsLetters/indio.png",
  "res://Assets/Sprites/Unions_EN/jackfruit.png",
  "res://Assets/Sprites/UnionsLetters/ketchup.png",
  "res://Assets/Sprites/UnionsLetters/leao.png",
  "res://Assets/Sprites/Unions_EN/mouse.png",
  "res://Assets/Sprites/Unions_EN/nectarine.png",
  "res://Assets/Sprites/Unions_EN/orange.png",
  "res://Assets/Sprites/UnionsLetters/pinguim.png",
  "res://Assets/Sprites/Unions_EN/quince.png",
  "res://Assets/Sprites/Unions_EN/umbrela.png"
]


var random_y = [140, 370, 600] 

func _ready():
	ad_control.is_played = true
	#reset points
	global.score = 0
	letters = _preload_resources("res://Assets/Sprites/Letters", "letter")
	generic_obj = _preload_resources("res://Assets/Sprites/Elements", "object")
	unions = _preload_resources("res://Assets/Sprites/UnionsLetters", "union")
	
	ad_control.lettercompare = letters #initialize array for comparison

	_initialize_score()
	
	_hide_unions()
	var y = 120
	var i = 0
	var arr = Array() #control the raffle position
	
	while (i < 3):
		#raffle
		randomize()
		var x = randi()%(letters.size())
		
		#verify
		if arr.find(x) == -1:
			_create_letter(letters[x],unions[x],y,i)
			_create_object(generic_obj[x],i)
			i+=1
			y+=200
#			ad_control.high[x]+=1
#			printt(ad_control.high)
			arr.append(x)
	pass

#obj is a sprite resource and value is a position
func _create_letter(obj,unions,value,index):
	if index == 0:
		letter1.set_texture(obj)
		pos_1.set_texture(unions)
	elif index == 1:
		letter2.set_texture(obj)
		pos_2.set_texture(unions)
	else:
		letter3.set_texture(obj)
		pos_3.set_texture(unions)
	pass
	
#create a object in the random position indicated in the pos_obj array
func _create_object(obj,index):
	randomize()
	var x = randi()%random_y.size()
	if index == 0:
		obj1.set_texture(obj)
		obj1.get_parent().set_pos(Vector2(900, random_y[x]))
	elif index == 1:
		obj2.set_texture(obj)
		obj2.get_parent().set_pos(Vector2(900, random_y[x]))
	else:
		obj3.set_texture(obj)
		obj3.get_parent().set_pos(Vector2(900, random_y[x]))
	random_y.remove(x) #remove object added
	pass
	
func _hide_unions():
	pos_1.hide()
	pos_2.hide()
	pos_3.hide()

func _on_return_pressed():
	loading.goto_scene("res://Scenes/Menu/play_menu.tscn")
	pass # replace with function body
	

func _preload_resources(var dirPath, var type):
	var resource = Array()
	if type == "letter":
		for i in range(letters.size()):
			var obj = load(letters[i])
			resource.append(obj)
#		printt("to aqui")
#		var dir = Directory.new()
#		dir.open(dirPath)
#		dir.list_dir_begin()
#		var file_name = dir.get_next()
#		while(file_name!=""): 
#			if dir.current_is_dir():
#				pass
#			else:
#				var obj = load(dirPath+"/"+file_name)
#				resource.append(obj)
#			file_name = dir.get_next()
	
	if ad_control.language == 0:
		if type == "object" or type == "union":
			var dir = Directory.new()
			dir.open(dirPath)
			dir.list_dir_begin()
			var file_name = dir.get_next()
			while(file_name!=""): 
				if dir.current_is_dir():
					pass
				else:
					var obj = load(dirPath+"/"+file_name)
					resource.append(obj)
				file_name = dir.get_next()
#		printt("letter", resource)

	if ad_control.language == 1:
#		printt("to aqui no ingles")
		if type == "object":
			for i in range(en_obj.size()):
				var obj = load(en_obj[i])
				resource.append(obj)
#			printt("object", resource)

		if type == "union":
			for i in range(en_union.size()):
				var obj = load(en_union[i])
				resource.append(obj)
#			printt("union", resource)
	return resource

func _initialize_score():
	#initialize error array with 0
	if ad_control.error.empty() and ad_control.correct.empty():
		for i in range(ad_control.lettercompare.size()):
			ad_control.correct.append(0)
			ad_control.error.append(0)
			ad_control.score.append(0)
