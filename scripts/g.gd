extends Node

var mouse_sens : float = 1.0
var resolution = {
1:Vector2(640,360),
2:Vector2(1280,720),
3:Vector2(1600,900),
4:Vector2(1920,1080)}
var current_resolution : Vector2 = resolution[1]
var is_fullscreen : bool = true
var is_vsync : bool = true 


var is_text_showing : bool = false
var is_quest_showing : bool = false
var bullets : int = 12
var max_bullets : int = 12
var ammo : int = 48
var can_pause = true
var killed_enemies = {
	0 : 0,
	1 : 0,
	2 : 0,
	3 : 0
}
var items = {
	0 : false,
	1 : false,
	2 : false,
	3 : false
}

# Тут хранится наша текущая сцена. Это был очень важный комментарий. 
var current_scene : Node 
# Мы не будем пользоваться встроенной командой change scene. Но узнать, какая сцена 
# у нас идёт изначально, хотелось бы. 
func _ready(): 
	current_scene = get_tree().current_scene 
# Код смены сцены 
func change_scene(path: String, params := []): 
	if ResourceLoader.exists(path): 
		if is_instance_valid(current_scene): 
			current_scene.queue_free() 
			current_scene = load(path).instantiate() 
			get_tree().root.add_child(current_scene) 
			# Для смены карты, к примеру, нам нужно знать, где спавнить игрока. 
			# В такие моменты нас спасёт вызов init с переданными параметрами! 
			if current_scene.has_method("init"): 
				current_scene.call_deferred("init", params) 
			else: printerr("No such scene: ", path)

func update_settings():
	if is_fullscreen:
		DisplayServer.WINDOW_MODE_FULLSCREEN
	else:
		DisplayServer.WINDOW_MODE_WINDOWED
	#get_tree().set_screen_stretch(SceneTree.STRETCH_MODE_2D, SceneTree.STRETCH_ASPECT_KEEP, G.current_resolution)
	DisplayServer.window_set_size(G.current_resolution)
	if is_vsync:
		DisplayServer.VSYNC_ENABLED
	else:
		DisplayServer.VSYNC_DISABLED
	
