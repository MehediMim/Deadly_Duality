extends Area2D

var move_speed=100
var move_dir:Vector2
var start_pos:Vector2
var target_pos:Vector2
var count=0
var direct

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	start_pos=global_position
	target_pos=start_pos+move_dir

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position=global_position.move_toward($"../player".global_position,move_speed*delta)
	direct=$"../player".position-$".".position
		


