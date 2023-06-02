extends CharacterBody3D
class_name Enemy 
@export var id : int
@export var hp : float
@export var ad : float
var target
@export var path_follow : PathFollow3D
@export var path_speed : float

enum state{stand, walk, run, shoot}
var current_state = state.stand  
var tween : Tween
func refresh():
	$AnimationTree.set("parameters/conditions/is_running", false)
	$AnimationTree.set("parameters/conditions/is_shooting", false)
	$AnimationTree.set("parameters/conditions/is_standing", false)
	$AnimationTree.set("parameters/conditions/is_walking", false)
	ai()
func ai():
	if current_state==state.stand:
		$AnimationTree.set("parameters/conditions/is_standing", true)
	elif current_state==state.walk:
		$AnimationTree.set("parameters/conditions/is_walking", true)
	elif current_state==state.run:
		$AnimationTree.set("parameters/conditions/is_running", true)
	elif current_state==state.shoot:
		$AnimationTree.set("parameters/conditions/is_shooting", true)
func attak():
	$ww1_style_soldier/fire.play()
func damage(x):
	hp-=x
	if hp<=0:
		die()
func die():
	G.killed_enemies[id]+=1
	get_parent().remove_child(self)
func _ready():
	refresh()
func _process(delta):
	print(current_state)
	if target:
		look_at(target.global_transform.origin, Vector3.UP)
		rotate_object_local(Vector3(0,1,0), 3.14)
		#look_at(target.position, transform.basis.y)
	if current_state == state.walk:
		if path_follow != null:
			path_follow.progress_ratio += path_speed*delta
			if path_follow.progress_ratio >= 1 || path_follow.progress_ratio <= 0:
				path_speed *= -1
				tween = create_tween()
				var c_rot = self.rotation + Vector3(0,PI,0)
				tween.tween_property(self, "rotation", c_rot, 0.5)
	elif current_state == state.stand:
		pass
	elif current_state == state.shoot:
		attak()

func _on_area_3d_body_entered(body):
	if body is Player:
		target=body
		current_state = state.shoot
		refresh()

func _on_area_3d_body_exited(body):
	if body is Player:
		target = null
		current_state = state.stand
		refresh()

func _on_timer_timeout():
	if current_state==state.walk:
		current_state=state.stand
	elif current_state==state.stand:
		current_state=state.walk
	refresh()
