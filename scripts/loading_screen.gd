extends Control
var scene : String
@onready var progress_bar : ProgressBar = $ProgressBar
var progress = []
var scene_load_status = 0
var started : bool = false

func init(params = ["res://scenes/game.tscn"]):
	scene = params[0]

func _process(_delta):
	if scene!=null:
		if !started:
			ResourceLoader.load_threaded_request(scene)
			started=true
		else:
			scene_load_status = ResourceLoader.load_threaded_get_status(scene, progress)
			progress_bar.value = progress[0] * 100
			if scene_load_status == ResourceLoader.THREAD_LOAD_LOADED:
				get_tree().change_scene_to_packed(ResourceLoader.load_threaded_get(scene))
				queue_free()
		
