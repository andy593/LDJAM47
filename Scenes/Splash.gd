extends Node2D
func _ready():
	pass

func _on_Timer_timeout():
	$Tween.interpolate_property($FadeOut, "color", Color(0,0,0,0), Color(0,0,0,1), .2, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()
