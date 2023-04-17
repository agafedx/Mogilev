extends Control
signal settings_changed

func _on_button_pressed():
	queue_free()


func _on_h_slider_value_changed(value):
	emit_signal("settings_changed",update_settings)


func _on_h_slider_2_value_changed(value):
	pass # Replace with function body.


func _on_h_slider_3_value_changed(value):
	pass # Replace with function body.


func _on_check_box_toggled(button_pressed):
	G.is_fullscreen = button_pressed


func _on_option_button_item_selected(index):
	G.current_resolution = G.resolution[index]


func _on_check_box_2_toggled(button_pressed):
	G.is_vsync = button_pressed

func update_settings():
	G.update_settings()
