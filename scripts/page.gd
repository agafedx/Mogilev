extends Control

@export var header : String
@export_multiline var story : String

func _ready():
	$Panel/Label.text = header
	$Panel/Label3.text = story
	$AnimationPlayer.play("idle")
	G.is_text_showing = true
	G.is_quest_showing = true
	for i in get_parent().get_children():
		if i is text_ivent:
			get_parent().remove_child(i)

func _input(event):
	if event.is_action_pressed("ui_accept"):
			get_parent().remove_child(self)
