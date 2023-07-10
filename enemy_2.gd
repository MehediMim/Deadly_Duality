extends Area2D
var blastseen:PackedScene=preload("res://blast.tscn")
var move_speed=80
var move_dir:Vector2
var start_pos:Vector2
var target_pos:Vector2
var count=0
var maxcount=3
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	start_pos=global_position
	target_pos=start_pos+move_dir

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position=global_position.move_toward($"../player".global_position,move_speed*delta)
	if count==maxcount:
		queue_free()
		

func _on_area_entered(area):
	$"../UI".update_point_text()
	count=count+1
	Globals.point+=20
	print("count")
	var l=blastseen.instantiate()
	#l.position=position
	$".".add_child(l)
	$sound.play()
	print("Got siinglnald")
