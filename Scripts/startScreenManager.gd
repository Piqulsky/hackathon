extends Node2D

func _ready():
	pass

func _process(delta):
	pass


func _on_start_game_button_down():
	get_tree().change_scene_to_file("res://Scenes/main_scene.tscn")


func _on_score_button_down():
	get_tree().change_scene_to_file("res://Scenes/highest_score_screen.tscn")


func _on_exit_button_down():
	get_tree().quit()
