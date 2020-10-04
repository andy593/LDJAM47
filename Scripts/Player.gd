extends Node2D
var isMouseClickable = 0
var drink = 0
var blood = 0
var gotCup = false
signal drinkSend

func _process(_delta):
	updateCursor()
	updatePlayerPosition()
	$Cursor.set_collision_mask(int(drink))
	$Cursor.set_collision_layer(int(drink))
	emit_signal("drinkSend")


func _on_Cursor_area_entered(_area):
	isMouseClickable = 1

func _on_Cursor_area_exited(_area):
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
	
	$Player/RightArm.frame = drink

func _on_Snootbeer_Snootbeer():
	if gotCup == true:
		drink = 1
	else:
		pass

func _on_Crudlite_Crudlite():
	if gotCup == true:
		drink = 2
	else:
		pass

func _on_Bloodweiser_Bloodweiser():
	if gotCup == true:
		drink = 3
	else:
		pass

func _on_DrBob_DrBob():
	if gotCup == true:
		drink = 4
	else:
		pass

func _on_Cups_GotCup():
	gotCup = true
	print("Got cup!")
	randomize()
	var glass = rand_range(1,3)
	drink = 6 + glass
