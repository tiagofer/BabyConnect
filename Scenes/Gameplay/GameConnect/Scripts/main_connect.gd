extends Control

#CONTAINERS NODES
onready var letter1 = get_node("letter_container/pos_1")
onready var letter2 = get_node("letter_container/pos_2")
onready var letter3 = get_node("letter_container/pos_3")

onready var obj1 = get_node("object_container/pos_1").get_child(1)
onready var obj2 = get_node("object_container/pos_2").get_child(1)
onready var obj3 = get_node("object_container/pos_3").get_child(1)


#LETTERS RESOURCES
var let_a = preload("res://Assets/Sprites/Letters/spr_letterA.png")
var let_e = preload("res://Assets/Sprites/Letters/spr_letterE.png")
var let_i = preload("res://Assets/Sprites/Letters/spr_letterI.png")
var let_o = preload("res://Assets/Sprites/Letters/spr_letterO.png")
var let_u = preload("res://Assets/Sprites/Letters/spr_letterU.png")

#OBJECTS RESOURCES
var obj_a = preload("res://Assets/Sprites/Elements/spr_pineaple.png")
var obj_e = preload("res://Assets/Sprites/Elements/spr_elephant.png")
var obj_i = preload("res://Assets/Sprites/Elements/spr_indian.png")
var obj_o = preload("res://Assets/Sprites/Elements/spr_egg.png")
var obj_u = preload("res://Assets/Sprites/Elements/spr_greap.png")

#UNION RESOURCES
var cn_a = preload("res://Assets/Sprites/Letters/a.png")
var cn_e = preload("res://Assets/Sprites/Letters/e.png")
var cn_i = preload("res://Assets/Sprites/Letters/i.png")
var cn_o = preload("res://Assets/Sprites/Letters/o.png")
var cn_u = preload("res://Assets/Sprites/Letters/u.png")

onready var pos_1 = get_node("/root/Control/container/pos_1")
onready var pos_2 = get_node("/root/Control/container/pos_2")
onready var pos_3 = get_node("/root/Control/container/pos_3")


var letters = [let_a, let_e, let_i, let_o, let_u]
var objects = [obj_a, obj_e, obj_i, obj_o, obj_u]
var unions = [cn_a, cn_e, cn_i,cn_o, cn_u] 

var random_y = [140, 370, 600] 

func _ready():
	_hide_unions()
	var y = 120
	var i = 0
	var arr = [50]
	while (i < 3):
		#raffle
		randomize()
		var x = randi()%5
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