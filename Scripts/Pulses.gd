extends Sprite
var stack = 1
onready var pulses = get_node(".")
onready var circles = get_node("Circles")
func _on_Timer_timeout():
	pulses.modulate = Color8(105,0,0,stack)
	stack += 1
	if stack == 2:
		pulses.visible = true
		circles.visible = true
	if stack >= 50:
		$Timer.set_paused(true)
	else:
		$Timer.wait_time = 1


