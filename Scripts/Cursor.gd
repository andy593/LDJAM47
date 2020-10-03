extends Area2D


# Declare member variables here. Examples:
# var a = 2
var cursorState = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(_delta):
	set_as_toplevel(true)
	position = get_global_mouse_position()
