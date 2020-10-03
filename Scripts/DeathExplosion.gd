extends Particles2D

func _on_DeathExplosion_tree_entered(): #pretty self explanatory
	emitting = true

func _on_ExplosionTimer_timeout():
	emitting = false
	queue_free()
