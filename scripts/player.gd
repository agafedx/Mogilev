class_name Player
extends CharacterBody3D
var look_sens = G.mouse_sens * 0.01
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity") 
var is_sprinting : bool = false
@export var speed : float = 3.5
@export var sprint : float = 1.7
@export var jump_velocity : float = 4.5
@onready var head = $head
@onready var cam = $head/Camera3D
@onready var at = $AnimationTree
@onready var raycast = $head/Camera3D/RayCast3D
@onready var textScene :PackedScene = load("res://scenes/text.tscn")
func _physics_process(delta):
	if !is_on_floor():
		velocity.y -= gravity * delta
		
	if Input.is_action_pressed("jump") && is_on_floor():
		velocity.y = jump_velocity
	
	if Input.is_action_pressed("sprint"):
		is_sprinting = true
	else:
		is_sprinting = false
	var input_dir = Input.get_vector("right","left","down","up")
	var direction = (transform.basis * Vector3(input_dir.x,0,input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
	else:
		velocity.x = move_toward(velocity.x,0,speed)	
		velocity.z = move_toward(velocity.x,0,speed)	
	if is_sprinting:
		velocity.x*=sprint
		velocity.z*=sprint
	move_and_slide()

func _process(_delta):
	if Input.is_action_pressed("fire") && G.bullets>0:
		$AnimationTree.get("parameters/playback").travel("fire")
	elif Input.is_action_pressed("fire") && G.bullets==0:
		$AnimationTree.get("parameters/playback").travel("reload")
	if Input.is_action_pressed("reload"):
		$AnimationTree.get("parameters/playback").travel("reload")
func _input(event):
	Input.mouse_mode=Input.MOUSE_MODE_CAPTURED
	if event is InputEventMouseMotion:
		rotation.y -=event.relative.x * look_sens
		cam.rotation.x -= event.relative.y * look_sens
		cam.rotation.x = clamp(cam.rotation.x, deg_to_rad(-80), deg_to_rad(90))
	$Control/Label.text = "FPS: %s"%[Engine.get_frames_per_second()]
func fire():
	G.bullets -= 1
	$Control/Panel/Label.text = str(G.bullets)+"/"+str(G.max_bullets)
	raycast.force_raycast_update()
	if!raycast.is_colliding():
		return
	var collider = raycast.get_collider()
	if collider is Enemy:
		collider.damage(10)
func reload():
	if G.ammo >= G.max_bullets:
		G.ammo -= G.max_bullets-G.bullets
		G.bullets = G.max_bullets
	elif G.ammo < G.max_bullets && G.ammo > 0:
		if G.bullets + G.ammo > G.max_bullets:
			var x : int = G.bullets + G.ammo - G.max_bullets
			G.bullets = G.max_bullets
			G.ammo = x
		else:
			G.bullets += G.ammo
			G.ammo = 0
	elif G.ammo < G.max_bullets && G.ammo == 0:
		at.get("parameters/playback").stop()
		at.get("parameters/playback").travel("idle")
		var t = textScene.instantiate()
		t.set_text(["Недостаточно патронов"])
		add_child(t)
	$Control/Panel/Label2.text=str(G.ammo)
	$Control/Panel/Label.text = str(G.bullets)+"/"+str(G.max_bullets)
