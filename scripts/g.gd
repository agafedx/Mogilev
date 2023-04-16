extends Node

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
