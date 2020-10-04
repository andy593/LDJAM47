extends Area2D

func _ready():
	$CrabTimer.wait_time = rand_range(60, 120)
	$CrabTimer.start()
	print("Crab time is" + str($CrabTimer.time_left) + " seconds!")


func _on_CrabTimer_timeout():
	$AnimationPlayer.play("CrabRunInAndWantAPickle")
	$CrabTimer.wait_time = rand_range(30, 90)
	$CrabTimer.start()
	print("Crab time is" + str($CrabTimer.time_left) + " seconds!")
