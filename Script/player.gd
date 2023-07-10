extends CharacterBody2D


const SPEED = 0
const JUMP_VELOCITY = 0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = 0

signal shooted(position)

var can_shoot=true


func _process(delta):
	look_at(get_global_mouse_position())
	
	var direction=Input.get_vector("left","right","up","down")
	move_and_slide()
	if Input.is_action_pressed("UP"):
		$".".position.y-=10
	if Input.is_action_pressed("DOWN"):
		$".".position.y+=10
	if Input.is_action_pressed("LEFT"):
		$".".position.x-=10
	if Input.is_action_pressed("RIGHT"):
		$".".position.x+=10
	
	if Input.is_action_just_pressed("Shoot") and can_shoot:
		$shoot_sound.play()
		var laser_markers=$laserStartPositions/Marker2D
		var selected_laser=laser_markers
		
		can_shoot=false
		shooted.emit(selected_laser.global_position)
		$Timer.start()
		
func _on_timer_timeout():
	can_shoot=true # Replace with function body.


