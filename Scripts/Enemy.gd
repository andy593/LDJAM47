extends Node2D
const Particle = preload("res://Scenes/DeathExplosion.tscn")
onready var AngerTimer = $AngerTimer
onready var EnemySprite = $SpriteRef
onready var EnemySpriteActual = $EnemyArea/EnemySprite
onready var tween = $GoToDoor
var drinkWanted = choice()
var sprites = []

func _ready():
	add_to_group("enemiesGROUP")
	chooseSprite()

func _on_GoToDoor_tween_completed(_object, _key): #tween stuff
	queue_free()

func _on_AngerTimer_timeout(): #if the customer gets angry they explode
	var particle = Particle.instance()
	var main = get_tree().current_scene
	main.add_child(particle)
	particle.global_position = position
	queue_free()

func _on_EnemyArea_DrinkGot(): #they got the drink they wanted
	EnemySpriteActual.hide()
	AngerTimer.paused = true
	tween.interpolate_property($SpriteRef,("global_position"),Vector2($EnemyArea/EnemySprite.global_position.x, $EnemyArea/EnemySprite.global_position.y),Vector2(440,20),1,Tween.TRANS_LINEAR) #no idea how to fix
	tween.start() #tween

func choice():
	randomize()
	drinkWanted = int(randi()%4+1)
	print("E",drinkWanted)
	return drinkWanted


func _on_EnemyArea_Death(): #When they got the wrong drink
	var particle = Particle.instance()
	var main = get_tree().current_scene
	main.add_child(particle)
	particle.global_position = position
	queue_free()\

func chooseSprite():
	var path = "res://Sprites/Enemies"
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
