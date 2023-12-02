extends Node2D

var sun :Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	sun = $Sun


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	pass

func change_sun(time):
	sun.position = Vector2(sun.position.x, (900 - time )/3 + 96)
	var timeVal = float(time)/900
	sun.modulate = Color(sun.modulate.r, timeVal, timeVal)
