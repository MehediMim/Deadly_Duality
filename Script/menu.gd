extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	$button_music.play()
	$Timer.start()
	
	

func _on_button_2_pressed():
	$button_music.play()
	$Timer2.start()
	

func _on_timer_timeout():
	get_tree().change_scene_to_file("res://tscn/select_character.tscn")


func _on_timer_2_timeout():
	get_tree().quit()
