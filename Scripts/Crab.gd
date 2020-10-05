extends Area2D
onready var CurrentlyInHand = get_node("/root/Loader")
onready var MISTAKES = get_node("/root/Loader")

func _ready():
	$CrabTimer.wait_time = rand_range(60, 120)
	$CrabTimer.start()
	print("Crab time is" + str($CrabTimer.time_left) + " seconds!")


func _on_CrabTimer_timeout():
	$AnimationPlayer.play("CrabRunInAndWantAPickle")
	$CrabTimer.wait_time = rand_range(30, 90)
	$CrabTimer.start()
	print("Crab time is" + str($CrabTimer.time_left) + " seconds!")

func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed() and CurrentlyInHand.get_drink() == 13:
		self.on_click()

func on_click(): #add score stuff here Andy
	if MISTAKES.get_mistake() > 0:
		MISTAKES.made_mistake(-1)
	CurrentlyInHand.update_drink(0)
