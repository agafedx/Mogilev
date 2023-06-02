extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	$activities/first_quest/soldier/AnimationPlayer.play("Scene")
