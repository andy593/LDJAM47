extends Node2D

var time = 55
var decTime = 0
var hasScaryTimeHappened = 0
const SCARYLIGHTNING = preload("res://Scenes/Flash.tscn")
	
func _process(delta):
	if time < 10:
		$ClockText.text = "11:59:0" + str(time)
	if time >= 10 and time < 60:
		$ClockText.text = "11:59:" + str(time)
	if time >= 60:
		$ClockText.text = "11:59:59." + str(decTime)
	if time == 60.00:
		scaryTime()
	if time >= 70:
		$ClockText.text = "11:59:59.9" + str(decTime) #software gore lmao im too dumb for this
	if time >= 79:
		$ClockText.text = "11:59:59.99" + str(decTime)
	if time >= 88:
		$ClockText.text = "11:59:59.999" + str(decTime)
	if time >= 97:
		$ClockText.text = "11:59:59.9999" + str(decTime)
	if time >= 106:
		$ClockText.text = "11:59:59.99999" + str(decTime)
	if time >= 115:
		$ClockText.text = "11:59:59.999999" + str(decTime)
	if time >= 124:
		$ClockText.text = "11:59:59.9999999" + str(decTime)
	if time >= 133:
		$ClockText.text = "11:59:59.99999999" + str(decTime)
	if time >= 142:
		$ClockText.text = "11:59:59.999999999" + str(decTime)
	if time >= 151:
		$ClockText.text = "11:59:59.9999999999" + str(decTime)
	if time >= 160:
		$ClockText.text = "11:59:59.99999999999" + str(decTime)
	if time >= 169:
		$ClockText.text = "11:59:59.999999999999" + str(decTime)
	if time >= 178:
		$ClockText.text = "11:59:59.9999999999999" + str(decTime)
	if time >= 187:
		$ClockText.text = "11:59:59.99999999999999" + str(decTime)
	if time >= 196:
		$ClockText.text = "11:59:59.999999999999999" + str(decTime)
	if time >= 205:
		$ClockText.text = "11:59:59.9999999999999999" + str(decTime)
	if time >= 214:
		$ClockText.text = "11:59:59.99999999999999999" + str(decTime)
	if time >= 223:
		$ClockText.text = "11:59:59.999999999999999999" + str(decTime)
	if time >= 232:
		$ClockText.text = "11:59:59.9999999999999999999" + str(decTime)
	if time >= 241:
		$ClockText.text = "11:59:59.99999999999999999999" + str(decTime)
	if time >= 220:
		$ClockText.text = "11:59:59.999999999999999999999" + str(decTime)
	if time >= 259:
		$ClockText.text = "11:59:59.9999999999999999999999" + str(decTime)
	if time >= 268:
		$ClockText.text = "11:59:59.99999999999999999999999" + str(decTime)
	if time >= 277:
		$ClockText.text = "11:59:59.999999999999999999999999" + str(decTime)
	if time >= 286:
		$ClockText.text = "11:59:59.9999999999999999999999999" + str(decTime)
	if time >= 295:
		$ClockText.text = "11:59:59.99999999999999999999999999" + str(decTime)
	if time >= 304:
		$ClockText.text = "11:59:59.999999999999999999999999999" + str(decTime)
	if time >= 313:
		$ClockText.text = "11:59:59.9999999999999999999999999999" + str(decTime)



func _on_ClockTimer_timeout():
	time = time + 1
	if time > 60:
		decTime = decTime +1
	if decTime == 10:
		decTime = 1
		
func scaryTime():
	if hasScaryTimeHappened == 0:
		var lightningInstance = SCARYLIGHTNING.instance()
		$Scream.play()
		$Thunder.play()
		$ClockText.modulate.r = 500
		$Sprite.frame = 1
		self.add_child(lightningInstance)
		hasScaryTimeHappened = 1



func _on_TickTockTimer_timeout():
	$TickTock.play()
