extends Button

@export var animPlay :AnimationPlayer
var animIndex = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_down():
	if text == "Start Game":
		get_tree().change_scene_to_file("res://main_scene.tscn")
	animPlay.play(str(animIndex))
	animIndex += 1
	if animIndex == 4:
		text = "Start Game"


func _on_skip_button_button_down():
	get_tree().change_scene_to_file("res://main_scene.tscn")
