extends Area2D
signal Bloodweiser

func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed():
		self.on_click()

func on_click():
	emit_signal("Bloodweiser")
	$BarTapSprite.frame = 1
	$PourTimer.start()
	$SFX.play()

func _on_PourTimer_timeout():
	$BarTapSprite.frame = 0
	
