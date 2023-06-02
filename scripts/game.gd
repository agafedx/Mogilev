extends Node

func _ready():
	var x = load("res://scenes/lvls/level_"+str(G.current_lvl)+".tscn")
	add_child(x.instantiate())

func _process(_delta):
	if Input.is_action_pressed("pause") && G.can_pause:
		process_mode = Node.PROCESS_MODE_PAUSABLE
		get_tree().paused = true
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		$Pause.show()
		G.can_pause = false
