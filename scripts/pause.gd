extends CanvasLayer

@onready var q = $Panel/Control/quest_container
@onready var qt :PackedScene = load("res://scenes/quest_template.tscn")

func _on_button_pressed():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	get_tree().paused = false
	visible=false
	$Timer.start()
	
func _on_button_2_pressed():
	var x = load("res://scenes/settings.tscn").instantiate() 
	add_child(x)

func _on_button_3_pressed():
	get_tree().quit()

func _on_visibility_changed():
	
	if q==null:
		return 0
	var skip : bool = false
	for i in q.get_children():
		i.queue_free()
	for i in cs.q:
			if i.is_active:
				skip = true
				if i.is_killing:
					var t = qt.instantiate()
					t.set_text("%s |%s %s/%s|" %[i.name, i.text, G.killed_enemies[i.act_id], i.count])
					q.add_child(t)
				else:
					var t = qt.instantiate()
					t.set_text("%s |%s" %[i.name, i.text])
					q.add_child(t)
			if skip:
				$Label.visible=false
			elif !skip:
				$Label.visible=true

func _on_timer_timeout():
	G.can_pause=true
