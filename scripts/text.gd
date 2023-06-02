extends Control
class_name text_ivent
var base_text : String 
var array_mode : bool = false
var text_arr : PackedStringArray
var num : int = 0

func _ready():
	G.is_text_showing = true
	if array_mode:
		$Label.text = text_arr[num]	
		$Timer.start()
	else:
		$Label.text = base_text	
		$Timer.start()
	num+=1
func set_text(text):
	if text is PackedStringArray:
		array_mode = true
		text_arr = text

	else:
		array_mode = false
		base_text = text[0]

func _on_timer_timeout():
	if array_mode:
		if text_arr.size()>num:
			$Label.text = text_arr[num]	
			num+=1	
			$Timer.start()
		else:
			G.is_text_showing = false
			get_parent().remove_child(self)
	else:
		G.is_text_showing = false
		get_parent().remove_child(self)
