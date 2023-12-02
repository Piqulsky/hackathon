extends Node2D

var sun :Sprite2D
var timer :Control

# Called when the node enters the scene tree for the first time.
func _ready():
	sun = $Sun
	timer = $EndTimer


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	sun.material.set_shader_parameter("red", timer.time/1000)
