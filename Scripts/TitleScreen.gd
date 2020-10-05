extends Sprite
var isMouseClickable = 0
signal fade

func _ready():
	pass # Replace with function body.
	
func _process(delta):
	updateCursor()
	updateScreenPosition()
	
func updateScreenPosition(): #moves player
	var mouse_pos = get_global_mouse_position() #ez
	global_position.y = - mouse_pos.y / 15 + 290
	global_position.x = - mouse_pos.x / 30 + 450
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

func _on_TextureButton_pressed():
	$FadeOut.visible = true
	$Tween.interpolate_property($FadeOut, "color", Color(0,0,0,0), Color(0,0,0,1), .2, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()

func _on_Tween_tween_all_completed():
	get_tree().change_scene("res://Scenes/World.tscn")


func _on_Secret_pressed():
	$SecretAudio.play()
