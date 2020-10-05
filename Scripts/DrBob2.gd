extends Area2D
onready var CurrentlyInHand = get_node("/root/Loader")

func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed():
		self.on_click()
	
func on_click():
	if CurrentlyInHand.get_drink() == 8:
		CurrentlyInHand.update_drink(16)
