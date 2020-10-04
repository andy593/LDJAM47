extends Node2D
onready var loader = get_node("/root/Loader")
onready var tweenIn = $TweenToSeat
onready var tweenOut = $TweenToDoor
var drinkWanted = 0
var sprites = []
var spawnTime = 5
var angerTime = 15
#decide sprite
#decide drink
#have a random amount of time pass, seat empty
#spawn in enemy and tween to seat
#wait, then have enemy request their drink
#if correct, have enemy be happy, wait, then leave, tweening back to door
#if incorrect or time expires, have enemy become upset and die
	
func _ready():
	resetEnemy()
	
func resetEnemy():
	randomize()
	decideSprite()
	decideDrink()
	decideSpawnTime()
	$SpawnTimer.start(spawnTime)
func _on_SpawnTimer_timeout():
	moveToSeat()
func _on_TweenToSeat_tween_all_completed():
	yield(get_tree().create_timer(1),"timeout")
	askForDrink()

	
func decideSprite(): #decides the enemy's sprite. normal during normal hours, scary during scarytime
	var path = "lol"
	if loader.isScaryTimeActive == 0:
		path = "res://Sprites/NormalEnemies"
	if loader.isScaryTimeActive == 1:
		path = "res://Sprites/Enemies"
	var dir = Directory.new()
	dir.open(path)
	dir.list_dir_begin()
	while true :
		var file_name = dir.get_next()
		if file_name == "":
			break
		elif !file_name.begins_with(".") and !file_name.ends_with(".import"):
			sprites.append(load(path + "/" + file_name))
	dir.list_dir_end()
	sprites.shuffle()
	var sprite = sprites[0]
	$Enemy/Sprite.texture = sprite

func decideDrink():
	randomize()
	drinkWanted = int(randi()%4+1)
	print("E",drinkWanted)
	return drinkWanted
	
func decideSpawnTime():
	var spawnTime = 5
	spawnTime = rand_range(5, 10) - (0.2 * loader.currentDifficulty) 
	if spawnTime <= 0.1:
		spawnTime = 0.1
	print("Time before spawn is" + str(spawnTime) + " seconds!")
	
func decideAngerTime():
	var angerTime = 15
	angerTime = 20 - (0.4 * loader.currentDifficulty)
	if angerTime <= 3:
		angerTime = 3
	print("Customer patience is" + str(angerTime) + " seconds!")
	
func moveToSeat():
	$Enemy.visible = true
	print("Enemy should now be visible...")
	tweenIn.interpolate_property($Enemy,"global_position",Vector2($Door.global_position.x, $Door.global_position.y),Vector2($Seat.global_position.x,$Seat.global_position.y),1,Tween.TRANS_LINEAR)
	tweenIn.start()

func askForDrink():
	$Enemy/Sprite.frame = 1
	$Enemy/Hitbox.disabled = false
	$Enemy/BubbleSprite.visible = true
	$AngerTimer.start(angerTime)
	
	
func _on_AngerTimer_timeout(): #if the customer gets angry they explode
	$Enemy/Sprite.frame = 3
	yield(get_tree().create_timer(1),"timeout")
#	var particle = Particle.instance()
#	var main = get_tree().current_scene
#	main.add_child(particle)
#	particle.global_position = $Enemy.global_position

	resetEnemyState()
func resetEnemyState(): #resets enemy, giving the illusion of despawning them
	$Enemy.visible = false
	$Enemy/Hitbox.disabled = true
	$Enemy/BubbleSprite.visible = false
	$Enemy/Sprite.frame = 0
	resetEnemy()
