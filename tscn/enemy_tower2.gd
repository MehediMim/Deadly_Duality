extends Node2D
var can_shoot=false
signal to_shot_from_tower(from,to)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Timer.start()
	look_at($"../../player2".position)

	


func _on_timer_timeout():
	to_shot_from_tower.emit($EnemyTower.position,$Marker2D.position)


