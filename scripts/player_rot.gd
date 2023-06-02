extends CharacterBody3D
var look_sens = G.mouse_sens * 0.01
@export var can_rot : bool = true
@onready var head = $head
@onready var cam = $head/Camera3D
var camx : float
func _input(event):
	Input.mouse_mode=Input.MOUSE_MODE_CAPTURED
	if can_rot:
		if event is InputEventMouseMotion:
			rotation.y -=event.relative.x * look_sens
			rotation.y = clamp(rotation.y, deg_to_rad(-40), deg_to_rad(5))
			cam.rotation.x -= event.relative.y * look_sens
			cam.rotation.x = clamp(cam.rotation.x, deg_to_rad(-40), deg_to_rad(40))
