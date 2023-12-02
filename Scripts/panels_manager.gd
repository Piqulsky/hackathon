extends Node2D

var target :Vector2
var corrected = true
@export var leftArrow :TextureButton
@export var rightArrow :TextureButton

# Called when the node enters the scene tree for the first time.
func _ready():
	target = position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	if position <= (target - Vector2(1, 0)) or position >= (target + Vector2(1, 0)):
		position = position.lerp(target, delta*4)
	elif not corrected:
		position = target
		corrected = true


func _on_left_arrow_button_down():
	if position <= Vector2(1280, 0):
		target = target + Vector2(1280, 0)
		corrected = false
		if target == Vector2(2560, 0):
			leftArrow.visible = false
		else:
			rightArrow.visible = true


func _on_right_arrow_button_down():
	if position >= Vector2(-1280, 0):
		target = target - Vector2(1280, 0)
		corrected = false
		if target == Vector2(-2560, 0):
			rightArrow.visible = false
		else:
			leftArrow.visible = true
