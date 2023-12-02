extends Node2D

var sun :Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	sun = $Sun


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	pass

func change_sun(time):
	sun.position += Vector2(0, float(time)/25)
	var diff = (1-float(time)/900)*0.1
	sun.modulate = Color(sun.modulate.r, sun.modulate.g-diff, sun.modulate.b-diff)
