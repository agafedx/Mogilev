extends Area3D
@onready var textScene :PackedScene = load("res://scenes/text.tscn")
@export_group("Sound","_s") 
@export var _s_is_with_sound: bool
@export var _s_sound : AudioStream
@export_group("Text event","_t") 
@export var _t_is_text: bool
@export_multiline var _t_text : String
@export_group("Quest event","_q") 
@export var _q_is_quest : bool
@onready var _q_quest_scene : PackedScene = load("res://scenes/quest_new.tscn")
@export var _q_id : int
@export_group("Page event","_p") 
@export var _p_is_page : bool
@export_multiline var _p_header : String
@export_multiline var _p_story : String
@onready var _p_page_scene : PackedScene = load("res://scenes/page.tscn")

var is_used: bool = false
func _on_body_entered(body):
	if body is Player && !is_used:
		if _s_is_with_sound:
			$AudioStreamPlayer.stream = _s_sound
			$AudioStreamPlayer.play()
		if _t_is_text && !G.is_text_showing:
			var t = textScene.instantiate()
			var x = _t_text.split(",")
			t.set_text(x)
			body.add_child(t)
			is_used = true
			$Sprite3D.hide()
		elif _q_is_quest && !G.is_quest_showing:
			var q = _q_quest_scene.instantiate()
			q.id = _q_id
			body.add_child(q)
			is_used = true
			$Sprite3D.hide()
		elif _p_is_page && !G.is_quest_showing:
			var p = _p_page_scene.instantiate()
			p.header = _p_header
			p.story = _p_story
			body.add_child(p)
			is_used = true
			$Sprite3D.hide()
