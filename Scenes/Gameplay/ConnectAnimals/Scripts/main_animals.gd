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


#var letters = [let_a, let_e, let_i, let_o, let_u]
#var objects = [obj_a, obj_e, obj_i, obj_o, obj_u]
#var unions = [cn_a, cn_e, cn_i,cn_o, cn_u] 

var letters = Array()
var objects = Array()
var unions = Array()

var random_y = [140, 370, 600] 

func _ready():
	#reset points
	global.score = 0
	letters = _preload_resources("res://Assets/Sprites/ConnectAnimals/Normal")
	objects = _preload_resources("res://Assets/Sprites/ConnectAnimals/Shadows")
	unions = _preload_resources("res://Assets/Sprites/ConnectAnimals/Unions")
	_hide_unions()
	var y = 120
	var i = 0
	var arr = Array()
	while (i < 3):
		#raffle
		randomize()
		var x = randi()%(letters.size()-1)
		#verify
		if arr.find(x) == -1:
			#create
			_create_letter(letters[x],unions[x],y,i)
			_create_object(objects[x],i)
			i+=1
			y+=200
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

func _preload_resources(var dirPath):
	var resource = Array()
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
	return resource