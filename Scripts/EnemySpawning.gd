extends Node2D
#var Number = 0
const Enemy = preload("res://Scenes/Enemy.tscn")
onready var SpawnTimer = $SpawnTimer
var enemySpawnColumn = 0
var currentInUse = []
var speedUp = 0.05
var spawn = {}
	
func _on_Timer_timeout(): #calls spawn_enemy on timeout,stops more than 3
	var enemyAmount = get_tree().get_nodes_in_group("enemiesGROUP").size() #gets how many enemies are currently present
	if enemyAmount <= 2:
		spawn_enemy()
	else:
		SpawnTimer.wait_time = 0
	
func spawn_enemy(): #spawn enemy and tween
	var enemy = Enemy.instance()
	var main = get_tree().current_scene
	main.add_child(enemy)
	enemy.global_position = global_position
