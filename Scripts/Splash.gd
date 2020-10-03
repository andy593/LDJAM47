extends Node2D
func _ready():
	pass

func _on_Timer_timeout():
	$Tween.interpolate_property($FadeOut, "color", Color(0,0,0,0), Color(0,0,0,1), .2, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()

func _on_Tween_tween_completed(object, key):
	get_tree().change_scene("res://Scenes/TitleScreen.tscn")
