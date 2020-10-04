extends Node2D
const Particle = preload("res://Scenes/DeathExplosion.tscn")
onready var AngerTimer = $AngerTimer
onready var EnemySprite = $SpriteRef
onready var EnemySpriteActual = $EnemyArea/EnemySprite
onready var tween = $GoToDoor
var drinkWanted = 1
#func _process(delta):
	
	

func _ready():
	add_to_group("enemiesGROUP")
	randomize()
	var drinkWanted = randi()%4+1
	$EnemyArea.set_collision_mask_bit(drinkWanted,true)
	$EnemyArea.set_collision_layer_bit(drinkWanted,true)
	print("E",drinkWanted)

func _on_GoToDoor_tween_completed(_object, _key): #tween stuff
	queue_free()

func _on_AngerTimer_timeout(): #if the customer gets angry they explode
	var particle = Particle.instance()
	var main = get_tree().current_scene
	main.add_child(particle)
	particle.global_position = position
	queue_free()

func _on_EnemyArea_Death():
	EnemySpriteActual.hide()
	AngerTimer.paused = true
	tween.interpolate_property($SpriteRef,("global_position"),Vector2($EnemyArea/EnemySprite.global_position.x, $EnemyArea/EnemySprite.global_position.y),Vector2(440,20),1,Tween.TRANS_LINEAR) #no idea how to fix
	tween.start() #tween
