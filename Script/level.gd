extends Node2D
var lease_scene:PackedScene=preload("res://tscn/bullets.tscn")
var lease_scene2:PackedScene=preload("res://tscn/bullets.tscn")
var lease_scene3:PackedScene=preload("res://tscn/bullet_enemy.tscn")

var seen1:PackedScene=preload("res://tscn/enemy_2.tscn")
var seen2:PackedScene=preload("res://tscn/emeny_3.tscn")

var laser
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("Quit"):
		get_tree().quit()
		
	if Globals.player_life==0:
		get_tree().change_scene_to_file("res://gameover.tscn")
	
	if abs($player.global_position.x-$medic.global_position.x)<40 and abs($player.global_position.y-$medic.global_position.y)<40:
		print($player.position)
		print($medic.position)
		Globals.player_life+=1
		$medic.position.x=randi()%17000
		$medic.position.y=(randi()%1300)-400
		$UI.update_health_text()
		
	if abs($player.global_position.x-$bonus.global_position.x)<40 and abs($player.global_position.y-$bonus.global_position.y)<40:
		print($player.position)
		print($bonus.position)
		Globals.point+=500
		$bonus.position.x=randi()%17000
		$bonus.position.y=(randi()%1300)-400
		$UI.update_point_text()
	

func _on_player_shooted(pstn):
	
	$"/root/Globals".bullet=$"/root/Globals".bullet-1
	print("just shooted in level")
	var laser=lease_scene.instantiate()
	laser.position=pstn
	#laser.direction=Vector2(pstn.x-$player.position.x,pstn.y-$player.position.y)
	var a=Vector2(get_global_mouse_position().x-pstn.x,get_global_mouse_position().y-pstn.y).normalized()
	laser.linear_velocity=a*1000
	$UI.update_laser_text()
	print("*")
	print($UI/Label.text)
	$dustbin.add_child(laser)
	

func _on_player_2_shooted_2(pos,from):
	
	print("just shooted 2 in level")
	var laser=lease_scene2.instantiate()
	laser.position=from
	#laser.direction=Vector2(pos.x-.position.x,pos.y-$player.position.y)
	var a=Vector2(from.x-pos.x,from.y-pos.y).normalized()
	#var d=Vector2(dir).normalized()
	#var a=Vector2(get_global_mouse_position().x-pos.x,get_global_mouse_position().y-pos.y).normalized()
	
	laser.linear_velocity=a*1000
	$dustbin.add_child(laser)


func _on_enemy_tower_to_shot_from_tower(from, to):
	print("just shooted 3 in level")
	var laser=lease_scene3.instantiate()
	laser.position=to
	#laser.direction=Vector2(pstn.x-$player.position.x,pstn.y-$player.position.y)
	var a=Vector2(from.x-to.x,from.y-to.y).normalized()
	laser.linear_velocity=a*2000
	$dustbin.add_child(laser)









func _on_a_placetogenerate_child_entered_tree(node):
	pass
	


func _on_timertogenerate_timeout():
	var xyz=[seen1,seen2]
	var kinds=xyz[randi()%xyz.size()]
	
	var seen=kinds.instantiate()
	
	$place.add_child(seen)


func _on_enemy_3_area_entered(area):
	print("New generated")


func _on_place_area_entered(area):
	print("Countttttttttt")





func _on_enemy_toshowgraphics(area):
	pass


func _on_tank_area_entered(area):
	print("New ")


func _on_enemy_53_area_entered(area):
	pass # Replace with function body.



