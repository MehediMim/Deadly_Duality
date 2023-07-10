extends Area2D




signal shooted2(position,direction)

var can_shoot=true


func _process(delta):
	look_at(get_global_mouse_position())
	#look_at($"../player".position)
	$".".rotation=$"../player".rotation
	var direction=Input.get_vector("left","right","up","down")

	
	$".".position.y=$"../player".position.y+200
	$".".position.x=$"../player".position.x
	
		
	if Input.is_action_just_pressed("Shoot") and can_shoot and Globals.bullet:
		var laser_markers=$laserStartPositions/Marker2D
		var selected_laser=laser_markers
		
		#can_shoot=false
		shooted2.emit($CharacterSingle1.global_position,$laserStartPositions/Marker2D.global_position)
	if !Globals.bullet and Input.is_action_just_pressed("Shoot"):
		$nobullet.play()


func _on_area_entered(area):
	$sound.play()
	Globals.player_life-=1
	$"../UI".update_health_text()
	
	
