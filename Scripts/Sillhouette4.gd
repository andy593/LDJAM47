extends Node2D
export var minRange = 60
export var maxRange = 110
func _ready():
	randomize()
	$Timer.start()
	$Timer.wait_time = rand_range(minRange, maxRange)



func _on_Timer_timeout():
	$AnimationPlayer.play("Walking")
	$Timer.start()
	$Timer.wait_time = rand_range(minRange, maxRange)
