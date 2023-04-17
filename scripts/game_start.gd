extends Control

func _on_button_pressed():
	G.change_scene("res://scenes/loading_screen.tscn",["res://scenes/game.tscn"])

func _on_button_2_pressed():
	var x=load("res://scenes/settings.tscn").instantiate() 
	add_child(x)


func _on_button_3_pressed():
	get_tree().quit()
