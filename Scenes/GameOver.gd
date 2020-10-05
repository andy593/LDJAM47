extends Node2D
onready var loader = get_node("/root/Loader")
var totalscore = 0
var lifeValue = 0
var crabScore = 0

func _ready():
	totalscore = loader.get_score()
	crabScore = loader.get_crab()
	lifeValue = stepify((totalscore * .53)+(crabScore * 2.09),.01)
	if totalscore == 0:
		$ScoreText.text = "Your last moments were completely wasted."
	elif totalscore > 0 and crabScore == 0:	
		$ScoreText.text = "You served " + str(totalscore) + " customers in your final moments.\n \n Your life was worth $" + str(lifeValue) + "\n \n Was it worth it?"
	else:
		$ScoreText.text = "You served " + str(totalscore) + " customers and " + str(crabScore) + " crabs in your final moments.\n \n Your life was worth $" + str(lifeValue) + "\n \n Was it worth it?"
func _process(delta):
	if Input.is_mouse_button_pressed(1):
		$FadeOut.visible = true
		$Tween.interpolate_property($FadeOut, "color", Color(0,0,0,0), Color(0,0,0,1), 4, Tween.TRANS_LINEAR, Tween.EASE_IN)
		$Tween.interpolate_property($BGM, "volume_db", 0, -40, 4, Tween.TRANS_LINEAR, Tween.EASE_IN)
		$Tween.start()
		



func _on_Tween_tween_all_completed():
	get_tree().change_scene("res://Scenes/Splash.tscn")


func _on_FadeTimer_timeout():
	$FadeOut.visible = true
	$Tween.interpolate_property($FadeOut, "color", Color(0,0,0,0), Color(0,0,0,1), 4, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.interpolate_property($BGM, "volume_db", 0, -40, 4, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()	
