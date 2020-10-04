extends Node

var currentDifficulty = 0 setget set_difficulty, get_difficulty
export var MISTAKES = 0

func instance_scene_on_main(scene, position):
	var main = get_tree().current_scene
	var instance = scene.instance()
	main.add_child(instance)
	instance.global_position = position
	return instance
func _ready():
	 Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	 randomize()
func _process(delta):
	if MISTAKES >=3:
		get_tree().change_scene("res://Scenes/Splash.tscn")

func set_difficulty(value):
	print("Difficulty is now " + str(currentDifficulty))
	currentDifficulty +=1
	
func get_difficulty():
	print("Difficulty sent!")
	return currentDifficulty
