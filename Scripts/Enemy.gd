extends Area2D

var enemySeatNumber = 0
var seat = {}

func _ready():
	$WaitTimer.start()
	
func _process(delta):
	pass

func get_seat_position(): #calculates where to put the enemy
	var points = $Doorway.get_children()
	var canPass = false
	if enemySeatNumber >= 4:
		enemySeatNumber = 0
	else:
		enemySeatNumber += 1
	return points[enemySeatNumber].global_position
	
func sit_down(): #places enemy at seat
	seat.global_position = get_seat_position()
	$Tween.interpolate_property($EnemySprite, "global_position", Vector2($Doorway.global_position.x, $Doorway.global_position.y), Vector2(seat.global_position.x,seat.global_position.y),1,Tween.TRANS_LINEAR)
	
func _on_WaitTimer_timeout():
	get_seat_position()
	sit_down()
