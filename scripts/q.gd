class_name Q
var name : String
var text : String
var act_id : int
var count : int
var is_active : bool = false
var is_killing : bool = true
var is_collecting : bool = false
func _init(n:String,t:String, id:int,kill := true, coll := false, num := 1):
	name = n
	text = t
	act_id = id
	count = num
	if kill == true:
		is_killing = true
	else:
		is_killing = false
	if coll == true:
		is_collecting = true
	else:
		is_collecting = false
func activate():
	is_active = true
func complete():
	is_active = false
