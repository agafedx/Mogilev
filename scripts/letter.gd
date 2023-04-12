extends Area3D
@onready var textScene :PackedScene = load("res://scenes/text.tscn")
@export var is_text: bool
@export_multiline var text : String
@export var is_activity : bool
@export var act_scene : PackedScene
@export var is_quest : bool
@export_multiline var q_text : String
@export var quest_scene : PackedScene
var is_used: bool = false
func _on_body_entered(body):
	if body is Player && !is_used:
		if is_text && !G.is_text_showing:
			var t = textScene.instantiate()
			var x = text.split(",")
			t.set_text(x)
			body.add_child(t)
			is_used = true
			$Sprite3D.hide()
		elif is_activity:
			$Sprite3D.hide()
		elif is_quest && !G.is_quest_showing:
			var q = quest_scene.instantiate()
			q.quest_text = q_text
			body.add_child(q)
			is_used = true
			$Sprite3D.hide()
