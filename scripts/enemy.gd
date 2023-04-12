class_name Enemy 
extends CharacterBody3D
@export var hp : float
@export var ad : float
@export var path_follow : PathFollow3D
@export var path_speed : float
var tween : Tween
func damage(x):
	hp-=x
	if hp<=0:
		die()
func die():
	get_parent().remove_child(self)

func _process(delta):
	if path_follow != null:
		path_follow.progress_ratio += path_speed*delta
		if path_follow.progress_ratio >= 1 || path_follow.progress_ratio <= 0:
			path_speed *= -1
			tween = create_tween()
			var c_rot = self.rotation + Vector3(0,PI,0)
			tween.tween_property(self, "rotation", c_rot, 0.5)
