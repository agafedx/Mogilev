extends Control
var id : int
var a : String = "Квест принят" 
var num : int = 0
var t : Timer
var b : bool= false 
func _ready():
	$Panel/RichTextLabel.text = cs.q[id].text
	$Panel/Label.text = cs.q[id].name
	$AnimationPlayer.play("idle")
	G.is_text_showing = true
	G.is_quest_showing = true
	for i in get_parent().get_children():
		if i is text_ivent:
			get_parent().remove_child(i)
func start():
	$Panel.visible=false
	t = Timer.new()
	t.wait_time = 0.03
	t.timeout.connect(t_timeout)
	add_child(t)
	t.start()
	cs.q[id].activate()
func t_timeout():
	if num<a.length():
		$Label.text += a[num]
		num += 1
		t.start()
	elif num==a.length():
		$Timer.start()
		t.stop()
func _input(event):
	if event.is_action_pressed("ui_accept"):
			start()

func _on_timer_timeout():
	G.is_text_showing = false
	G.is_quest_showing = false
	get_parent().remove_child(self)
