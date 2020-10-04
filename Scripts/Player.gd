extends Node2D
var isMouseClickable = 0
onready var CurrentlyInHand = get_node("/root/Loader")
var blood = 0
var gotCup = 0
signal drinkSend
	
func _process(_delta):
	updateCursor()
	updatePlayerPosition()
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
	
	$Player/RightArm.frame = CurrentlyInHand.get_drink()

func _on_Snootbeer_Snootbeer():
	Drink_update_update_lolidk(1)

func _on_Crudlite_Crudlite():
	Drink_update_update_lolidk(2)

func _on_Bloodweiser_Bloodweiser():
	Drink_update_update_lolidk(3)

func _on_DrBob_DrBob():
	Drink_update_update_lolidk(4)

func Drink_update_update_lolidk(drinknum):
	if gotCup == 2:
		CurrentlyInHand.update_drink(drinknum)
	else:
		pass

func _on_Rglass_GotRglass():
	grab_beverage_container(2)

func _on_Wglass_GotWglass():
	grab_beverage_container(3)

func _on_Soupbowls_GotSoupCont():
	grab_beverage_container(1)

func grab_beverage_container(glass):
	CurrentlyInHand.update_drink(6 + glass)
	gotCup = glass


func _on_Bottomselect_BottomItemGrabbed(num):
	if (num != 1) and (num != 3) and (gotCup == 2):
		CurrentlyInHand.update_drink(9 + num)
	elif num == 1 and gotCup == 3:
		CurrentlyInHand.update_drink(9 + num)
	elif num == 3 and gotCup == 1:
		CurrentlyInHand.update_drink(9 + num)
	else:
		pass
