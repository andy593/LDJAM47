extends Node


onready var mistakes = get_node("/root/Loader")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func _process(delta):
	if Input.is_action_just_pressed("ui_down"): 
		mistakes.made_mistake(0)
	var strikes = mistakes.get_mistake()
	if strikes >= 3:
		$BGM.stop()
		$BGM2.stop()
		$Clock/TickTock.stop()
		for enemy in get_tree().get_nodes_in_group("enemiesGROUP"):
			enemy.queue_free()
		$Black.visible = true

func _on_BGM_finished():
	$BGM2.play()
	

func _on_Clock_scaryTime():
	$WindowNormal.frame = 1
	$YardNormal.frame = 1
	$YardNormalForeground.frame = 1

