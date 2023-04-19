extends Resource
class_name Q

@export_multiline var name : String
@export_multiline var text : String
@export var act_id : int
@export var count : int
@export var is_active : bool = false
@export var is_killing : bool = true
@export var is_collecting : bool = false

func activate():
	is_active = true
func complete():
	is_active = false
