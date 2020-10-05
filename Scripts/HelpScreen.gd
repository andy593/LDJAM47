extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("TextFadeInAndOut")
	$SFX.play()
	
func _process(delta):
	if Input.is_mouse_button_pressed(1):
		get_tree().change_scene("res://Scenes/TitleScreen.tscn")
