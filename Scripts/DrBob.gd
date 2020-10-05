extends Area2D
signal DrBob

func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed():
		self.on_click()
func on_click():
	emit_signal("DrBob")
	$BarTapSprite.frame = 1
	$PourTimer.start()

func _on_PourTimer_timeout():
	$BarTapSprite.frame = 0
	
