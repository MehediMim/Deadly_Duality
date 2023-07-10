extends CanvasLayer

@onready var score:Label=$Label2

# Called when the node enters the scene tree for the first time.
func _ready():
	update_score_text()


func _on_button_pressed():
	get_tree().quit()

func update_score_text():
	score.text=str(Globals.point)
