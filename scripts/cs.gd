extends Node
var q = [Q.new("Убейте 3 ниг","text1",0, true, false, 3),
		Q.new("Собери лут","Собери лут, выпавший с 3 ниг", 1, false, true)]
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
