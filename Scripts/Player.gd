extends Node2D

var isMouseClickable = 0

func _ready():
	pass # Replace with function body.
	
func _process(delta):
	updateCursor()
	updatePlayerPosition()

func _on_Cursor_area_entered(area):
	isMouseClickable = 1

func _on_Cursor_area_exited(area):
	isMouseClickable = 0

func updateCursor(): #changes cursor animation
	if Input.is_mouse_button_pressed(1):
		$Cursor/CursorSprite.frame = 0
	elif isMouseClickable == 1:
		$Cursor/CursorSprite.frame = 2
	else:
		$Cursor/CursorSprite.frame = 1

func updatePlayerPosition(): #moves player
	var mouse_pos = get_global_mouse_position() #ez
	$Player.position.x = mouse_pos.x / 2 + 160
	if mouse_pos.x < 192:  #thanks mardood
		$Player.frame = 2
		$Player/LeftArm.show_behind_parent = true
		$Player/RightArm.show_behind_parent = false
	elif mouse_pos.x >= 192 and mouse_pos.x <= 382:
		$Player.frame = 1
		$Player/LeftArm.show_behind_parent = true
		$Player/RightArm.show_behind_parent = true
	elif mouse_pos.x > 382:
		$Player.frame = 0
		$Player/LeftArm.show_behind_parent = false
		$Player/RightArm.show_behind_parent = true
