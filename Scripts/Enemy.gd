extends Node2D
const Particle = preload("res://Scenes/DeathExplosion.tscn")
onready var AngerTimer = $AngerTimer
onready var tweenOut = $GoToDoor
onready var tweenIn = $GoToSeat
onready var loader = get_node("/root/Loader")
var drinkWanted = decideDrink()
var sprites = []
var enemySeat = 0
var seat = {}

func _ready():
	add_to_group("enemiesGROUP")
	chooseSprite()
	decideSeat()
	enterScene()
func _process(delta):
	if AngerTimer.time_left < 1:
		$EnemyArea/EnemySprite.frame = 3
	
func decideSeat(): #decides where enemy will sit down
	var point = $Seats.get_children()
	if enemySeat >= 2:
		enemySeat = 0
	else:
		enemySeat += 1
	return point[enemySeat].global_position
	
func enterScene(): #when enemy enters the scene
	seat.global_position = decideSeat()
	tweenIn.interpolate_property($EnemyArea,"global_position",Vector2($EnemyArea.global_position.x, $EnemyArea.global_position.y),Vector2(seat.global_position.x,seat.global_position.y),1,Tween.TRANS_LINEAR)
	tweenIn.start() #tween
	
func decideDrink(): #decides the enemy's requested drink
	randomize()
	drinkWanted = int(randi()%4+1)
	print("E",drinkWanted)
	return drinkWanted
	
func generateBubble(): #generates the speech bubble for the enemy
	pass

func _on_GoToSeat_tween_all_completed(): #once enemy sits down
	var requestedDrink = 0
	yield(get_tree().create_timer(1),"timeout")
	$EnemyArea/EnemyAreaShape.disabled = false
	$EnemyArea/EnemySprite.frame = 1
	
	
	
func _on_GoToDoor_tween_completed(_object, _key): #when enemy has left the bar
	queue_free()

func _on_AngerTimer_timeout(): #if the customer gets angry they explode
	var particle = Particle.instance()
	var main = get_tree().current_scene
	main.add_child(particle)
	particle.global_position = $EnemyArea.global_position
	queue_free()

func _on_EnemyArea_DrinkGot(): #they got the drink they wanted
	$EnemyArea/EnemySprite.frame = 2
	yield(get_tree().create_timer(2),"timeout")
	$EnemyArea/EnemySprite.frame = 4
	AngerTimer.paused = true
	tweenOut.interpolate_property($EnemyArea/EnemySprite,("global_position"),Vector2($EnemyArea/EnemySprite.global_position.x, $EnemyArea/EnemySprite.global_position.y),Vector2(440,20),1,Tween.TRANS_LINEAR) #no idea how to fix
	tweenOut.start() #tween



func _on_EnemyArea_Death(): #When they got the wrong drink
	var particle = Particle.instance()
	var main = get_tree().current_scene
	main.add_child(particle)
	particle.global_position = position
	queue_free()

func chooseSprite(): #picks enemy's sprite
	var path = 0
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
	$EnemyArea/EnemySprite.texture = sprite

