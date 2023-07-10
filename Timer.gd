extends Timer

var ene2=preload("res://tscn/enemy_2.tscn")
var ene3=preload("res://tscn/emeny_3.tscn")
var direction=Vector2.UP
# Called when the node enters the scene tree for the first time.
var enem = [ene2,ene3]
var kinds=enem[randi()%enem.size()]
var en=kinds.instantiate()
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	en.position.x=en.position.x-10


func _on_timeout():
	enem = [ene2,ene3]
	kinds=enem[randi()%enem.size()]
	en=kinds.instantiate()
	en.position=Vector2(randi_range(10,998),randi_range(10,998))
	
	#add_child(en)
	wait_time=randf_range(0,1)

