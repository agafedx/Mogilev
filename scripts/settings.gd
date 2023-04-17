extends Control

func _ready():
	var x = G.resolution.values().find(G.current_resolution)
	$Panel/CheckBox.button_pressed = G.is_fullscreen
	$Panel/CheckBox.button_pressed = G.is_vsync
	$Panel/HBoxContainer/OptionButton.selected = x
	if G.is_fullscreen:
		$Panel/HBoxContainer/OptionButton.disabled = true
	else:
		$Panel/HBoxContainer/OptionButton.disabled = false

func _on_button_pressed():
	queue_free()


func _on_h_slider_value_changed(_value):
	pass


func _on_h_slider_2_value_changed(_value):
	pass # Replace with function body.


func _on_h_slider_3_value_changed(_value):
	pass # Replace with function body.


func _on_check_box_toggled(button_pressed):
	G.is_fullscreen = button_pressed
	if G.is_fullscreen:
		$Panel/HBoxContainer/OptionButton.disabled = true
	else:
		$Panel/HBoxContainer/OptionButton.disabled = false


func _on_option_button_item_selected(index):
	G.current_resolution = G.resolution[index]


func _on_check_box_2_toggled(button_pressed):
	G.is_vsync = button_pressed

func _on_button_2_pressed():
	print("x")
	G.update_settings()
