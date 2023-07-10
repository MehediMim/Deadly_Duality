extends Area2D



signal shooted(position)

var can_shoot=true


func _process(delta):
	look_at(get_global_mouse_position())
	
	var direction=Input.get_vector("left","right","up","down")
	print(position)
	if Input.is_action_pressed("UP") and $".".global_position.y>-400:
		$".".position.y-=6
	if Input.is_action_pressed("DOWN") and $".".global_position.y<900:
		$".".position.y+=6
	if Input.is_action_pressed("LEFT") and $".".global_position.x>-152:
		$".".position.x-=6
	if Input.is_action_pressed("RIGHT") and $".".global_position.x<17100:
		$".".position.x+=6
	if Input.is_action_pressed("Reload"):
		$reload.start()
		$soundReload.play()
		
	if Input.is_action_just_pressed("Shoot") and can_shoot and Globals.bullet:
		$shoot_sound.play()
		var laser_markers=$laserStartPositions/Marker2D
		var selected_laser=laser_markers
		
		can_shoot=false
		shooted.emit(selected_laser.global_position)
		$Timer.start()
		
	if !Globals.bullet and Input.is_action_just_pressed("Shoot"):
		$nobullet.play()
		
func _on_timer_timeout():
	can_shoot=true # Replace with function body.



func _on_area_entered(area):
	$sound.play()
	Globals.player_life-=1
	$"../UI".update_health_text()


func _on_reload_timeout():
	if Globals.bullet<30:
		Globals.bullet=30
		var seen1:PackedScene=preload("res://reloading.tscn")
		var seen=seen1.instantiate()
		

	
	
