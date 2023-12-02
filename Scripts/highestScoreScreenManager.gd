extends Node2D

func _ready():
	pass

func _process(delta):
	pass


func _on_exit_score_screen_button_down():
	get_tree().change_scene_to_file("res://Scenes/start_scene.tscn")
