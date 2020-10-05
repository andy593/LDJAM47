extends Area2D
onready var TV = get_node(".")
onready var TVs = get_node("Sprite")
onready var isScaryTimeActive = get_node("/root/Loader")
var count = 0
var spook = 0
func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed():
		self.on_click()

func _process(delta):
	if isScaryTimeActive.get_ScaryTime() == 1 and count == 0:
		count = 1
	TVs.frame = int(count + int(isScaryTimeActive.get_ScaryTime()*3))

func on_click():
	if isScaryTimeActive.get_ScaryTime() == 1:
		spook = 3
	if count + spook >= 3 + spook:
		count = 1
	else:
		count += 1
		
