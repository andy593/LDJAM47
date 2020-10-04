extends Position2D
const ENEMY = preload("res://Scenes/Enemy.tscn")
const CLOCK = preload("res://Scenes/Clock.tscn")
onready var difficulty = get_node("/root/Loader")
var enemySpawnColumn = 0
var spawn = {}

func get_spawn_position(): #calculates where to put the enemy
	var points = $EntryPoints.get_children()
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
		$SpawnTimer.wait_time = 1
		
func spawn_enemy(): #spawn enemy and tween
	var tweenSpeed =  1 - .1*difficulty.get_difficulty()
	if tweenSpeed < .2:
		tweenSpeed = .2
	spawn.global_position = get_spawn_position()
	$Tween.interpolate_property($EnemyRef,"global_position",Vector2($SpawnPoints.global_position.x, $SpawnPoints.global_position.y),Vector2(spawn.global_position.x,spawn.global_position.y),tweenSpeed ,Tween.TRANS_LINEAR)
	$Tween.start() #tween
	
func _on_EnemyMoveToDesk_tween_completed(object, _key):
	$Tween.reset(object) #stops tween animation
	var enemy = ENEMY.instance()
	var main = get_tree().current_scene
	main.add_child(enemy)
	enemy.global_position = spawn.global_position
