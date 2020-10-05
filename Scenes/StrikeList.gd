extends Node2D

onready var mistakes = get_node("/root/Loader")
var strikes = 0
var strike1Play = false
var strike2Play = false
var strike3Play = false

func _process(delta):
	var strikes = mistakes.get_mistake()
	if strikes == 0:
		$Animation.play("0Strikes")
	if strikes == 1:
		if strike1Play == false:
			$Buzzer.play()
			strike1Play = true
		$Animation.play("1Strike")
	if strikes == 2:
		if strike2Play == false:
			$Buzzer.play()
			strike2Play = true
		$Animation.play("2Strike")
	if strikes == 3:
		if strike3Play == false:
			$Buzzer.play()
			strike3Play = true
		$Animation.play("3Strikes")
