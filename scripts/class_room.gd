extends Node3D


func _ready():
	$AnimationPlayer.play("level_anim")

func teacher_anim():
	$scene2/AnimationPlayer.play("All Animations")
	$teacher_speech.play()

func play_blinking():
	$UI/AnimationPlayer.play("blinking")

func play_sleep():
	$UI/AnimationPlayer.play("sleep")
	$player_rot.can_rot = false

func go_further():
	G.current_lvl+=1
	G.change_scene("res://scenes/loading_screen.tscn", ["res://scenes/game.tscn"])
