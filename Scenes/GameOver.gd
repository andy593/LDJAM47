extends Node2D




func _process(delta):
	if Input.is_mouse_button_pressed(1):
		$FadeOut.visible = true
		$Tween.interpolate_property($FadeOut, "color", Color(0,0,0,0), Color(0,0,0,1), 4, Tween.TRANS_LINEAR, Tween.EASE_IN)
		$Tween.interpolate_property($BGM, "volume_db", 0, -80, 4, Tween.TRANS_LINEAR, Tween.EASE_IN)
		$Tween.start()


func _on_Tween_tween_all_completed():
	get_tree().change_scene("res://Scenes/Splash.tscn")


func _on_FadeTimer_timeout():
	$FadeOut.visible = true
	$Tween.interpolate_property($FadeOut, "color", Color(0,0,0,0), Color(0,0,0,1), 4, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.interpolate_property($BGM, "volume_db", 0, -80, 4, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()	
