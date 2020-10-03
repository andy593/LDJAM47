extends Node2D
const Particle = preload("res://Scenes/DeathExplosion.tscn")
onready var AngerTimer = $AngerTimer
onready var EnemySprite = $SpriteRef
onready var EnemySpriteActual = $EnemyArea/EnemySprite
onready var tween = $GoToDoor
signal Died

func _ready():
	add_to_group("enemiesGROUP")

func _on_EnemyArea_area_entered(area): #finds out if the cursor has touched the enemy
	EnemySpriteActual.hide()
	AngerTimer.paused = true
	tween.interpolate_property($SpriteRef,("position"),Vector2(0, 0),Vector2(-(position.x -320),-position.y),1,Tween.TRANS_LINEAR) #no idea how to fix
	tween.start() #tween

func _on_GoToDoor_tween_completed(object, key): #tween stuff
	queue_free()

func _on_AngerTimer_timeout(): #if the customer gets angry they explode
	var particle = Particle.instance()
	var main = get_tree().current_scene
	main.add_child(particle)
	particle.global_position = position
	queue_free()



