extends Node2D

var vBox :VBoxContainer
const scoreScene = preload("res://GUI/score.tscn")

func _ready():
	vBox = $ScrollContainer/VBoxContainer
	for score in Global.stats:
		var s = scoreScene.instantiate()
		s.fill_with_data(score["name"], score["people"], score["heritage"])
		vBox.add_child(s)
	_update_local()

func _update_local():
	$TitleScoreScreen.text = tr("HIGH_SCORES")
	$ExitScoreScreenButton/ExitButtonText.text = tr("BUTTON_RETURN")
	$ScrollContainer/VBoxContainer/Score/NameLabel.text = tr("SCORE_NAME")
	$ScrollContainer/VBoxContainer/Score/PeopleLabel.text = tr("SCORE_MLN")
	$ScrollContainer/VBoxContainer/Score/HeritageLabel.text = tr("SCORE_PERCENT")

func _process(delta):
	pass


func _on_exit_score_screen_button_down():
	get_tree().change_scene_to_file("res://Scenes/start_scene.tscn")
