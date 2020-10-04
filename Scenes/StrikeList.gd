extends Node2D

onready var mistakes = get_node("/root/Loader")
var strikes = 0

func _process(delta):
	var strikes = mistakes.get_mistake()
	if strikes == 0:
		$Animation.play("0Strikes")
	if strikes == 1:
		$Animation.play("1Strike")
	if strikes == 2:
		$Animation.play("2Strike")
	if strikes == 3:
		$Animation.play("3Strikes")
