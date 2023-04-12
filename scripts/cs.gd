extends Node
signal quest_completed(a:Quest)
signal quest_activated(a:Quest)
var q = [Quest.new("a", "text"), Quest.new("b","text")]
var aq = []
func _ready():
	connect("quest_activated",quest_activated_call)
class Quest:
	var name : String
	var is_active : bool = false
	var text : String
	func _init(n:String,t:String):
		name = n
		text = t
	func Activate():
		emit_signal("quest_activated", self)
	func Complete():
		emit_signal("quest_completed", self)
func _process(_delta):
	if aq !=[]:
		print(aq)
func quest_activated_call(a:Quest):
	aq.append(a)
