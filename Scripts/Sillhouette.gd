extends Node2D
export var minRange = 20
export var maxRange = 40
func _ready():
	randomize()
	$Timer.start()
	$Timer.wait_time = rand_range(minRange, maxRange)



func _on_Timer_timeout():
	$AnimationPlayer.play("Walking")
	$Timer.start()
	$Timer.wait_time = rand_range(minRange, maxRange)
