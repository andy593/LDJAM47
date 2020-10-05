extends Node

#var currentDifficulty = 0 setget set_difficulty, get_difficulty
var MISTAKES = 0 setget made_mistake, get_mistake
var CurrentlyInHand = 0 setget update_drink, get_drink
var isScaryTimeActive = 0 setget set_ScaryTime, get_ScaryTime
var totalScore = 0 setget add_score, get_score
var crabScore = 0 setget add_crab, get_crab

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
		yield(get_tree().create_timer(3),"timeout")
		get_tree().change_scene("res://Scenes/GameOver.tscn")
		MISTAKES = 0

#func set_difficulty(value):
#	print("Difficulty is now " + str(currentDifficulty))
#	currentDifficulty +=1
	
#func get_difficulty():
#	print("Difficulty sent!")
#	return currentDifficulty

func made_mistake(value):
	print ("WOW! you fucked up idiot")
	MISTAKES += value

func get_mistake():
	return MISTAKES
	
func update_drink(Drink):
	CurrentlyInHand = int(Drink)

func get_drink():
	return int(CurrentlyInHand)

func set_ScaryTime(value):
	isScaryTimeActive = 1
	print("Scary time is active!")

func get_ScaryTime():
	return isScaryTimeActive
	
func add_score(points):
	totalScore = totalScore + points
	print("Current score: " + str(totalScore))

func get_score():
	return totalScore
	
func add_crab(points):
	crabScore = crabScore + points
	print("Current crab: " + str(totalScore))

func get_crab():
	return crabScore
	
func reset_all():
	var currentDifficulty = 0
	var MISTAKES = 0
	var CurrentlyInHand = 0
	var isScaryTimeActive = 0
	var totalScore = 0
	var crabScore = 0
