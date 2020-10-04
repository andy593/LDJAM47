extends Area2D
var inside = false
onready var EnemyDrink = get_node("..").drinkWanted
signal Death
func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed() and inside == true:
		on_click()

func on_click():
	emit_signal("Death")

func _on_EnemyArea_area_entered(_area):
	inside = true

func _on_EnemyArea_area_shape_exited(_area_id, _area, _area_shape, _self_shape):
	inside = false
