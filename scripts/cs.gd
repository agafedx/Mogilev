extends Node
@export var q : Array[Resource] 
func _ready():
	if q !=[]:
		for i in q:
			print("%s, %s, %s, %s, %s, %s" % [i.name, i.text, i.act_id, i.is_killing, i.is_collecting, i.count])
func _process(_delta):
	for i in q:
		if i.is_active:
			if i.is_killing:
				if G.killed_enemies[i.act_id]==i.count:
					print("%s выполнена"%[i.name])
					i.complete()
			else:
				if G.items[i.act_id]==true:
					print("%s выполнена"%[i.name])
					i.complete()
