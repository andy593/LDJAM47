extends Area2D
signal BottomItemGrabbed(num)
var num = 1

func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed():
		self.on_click()
		
func on_click():
	var mouse = get_local_mouse_position()
	num = int(ceil(mouse.x/16)) - 5
	emit_signal("BottomItemGrabbed",num)

