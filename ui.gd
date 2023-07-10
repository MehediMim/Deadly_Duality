extends CanvasLayer

@onready var laser_label:Label=$Label2
@onready var point:Label=$Label3
@onready var health:ProgressBar=$ProgressBar


func _ready():
	update_laser_text()
	update_point_text()
	update_health_text()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func update_laser_text():
	laser_label.text=str(Globals.bullet)
func update_point_text():
	point.text=str(Globals.point)
func update_health_text():
	health.value=Globals.player_life

