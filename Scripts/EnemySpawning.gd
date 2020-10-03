extends Node2D
#var Number = 0
const Enemy = preload("res://Scenes/Enemy.tscn")
onready var tween = $EnemyMoveToDesk
onready var SpawnTimer = $SpawnTimer
onready var SpawnPoints = $SpawnPoints #gets stuff
var enemySpawnColumn = 0
var currentInUse = []
var speedUp = 0.05
var spawn = {}
	
func get_spawn_position(): #calculates where to put the enemy
	var points = SpawnPoints.get_children()
	var canPass = false
	if enemySpawnColumn >= 4:
		enemySpawnColumn = 0
	else:
		enemySpawnColumn += 1
	return points[enemySpawnColumn].global_position

func _on_Timer_timeout(): #calls spawn_enemy on timeout,stops more than 5 spawning
	var enemyAmount = get_tree().get_nodes_in_group("enemiesGROUP").size() #gets how many enemies are currently present
	if enemyAmount <= 4:
		spawn_enemy()
	else:
		SpawnTimer.wait_time = 0
	
func spawn_enemy(): #spawn enemy and tween
	spawn.position = get_spawn_position()
	tween.interpolate_property($EnemyRef,"position",Vector2(0, 0),Vector2(spawn.position.x -320,spawn.position.y),1,Tween.TRANS_LINEAR)
	tween.start() #tween

func _on_EnemyMoveToDesk_tween_completed(object, _key):
	tween.reset(object) #stops tween animation
	var enemy = Enemy.instance()
	var main = get_tree().current_scene
	main.add_child(enemy)
	enemy.global_position = spawn.position
