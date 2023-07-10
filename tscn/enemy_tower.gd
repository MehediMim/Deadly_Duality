extends Node2D

var can_shoot=true
signal to_shot_from_tower(from,to)
# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var cs1=$"../../player".global_position.x-$".".global_position.x
	var cs2=$"../../player".global_position.y-$".".global_position.y
	

	look_at($"../../player".position)
	#print(sqrt(cs1*cs1 + cs2*cs2))
	if can_shoot and sqrt(cs1*cs1 + cs2*cs2)<500:

		to_shot_from_tower.emit($EnemyTower.global_position,$Marker2D.global_position)
		can_shoot=false
	


func _on_timer_timeout():
	can_shoot=true


