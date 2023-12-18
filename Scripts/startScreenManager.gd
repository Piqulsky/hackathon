extends Node2D

func _ready():
	TranslationServer.set_locale("en")
	_update_local()

func _update_local():
	$TitleStartingScreen.text = tr("TITLE")
	$StartGameButton/StartButtonText.text = tr("BUTTON_START")
	$ScoreButton/ScoreButtonText.text = tr("BUTTON_SCORES")
	$OptionsButton/OptionsButtonText.text = tr("BUTTON_SETTINGS")
	$ExitButton/ExitButtonText.text = tr("BUTTON_EXIT")

func _process(delta):
	pass


func _on_start_game_button_down():
	get_tree().change_scene_to_file("res://Scenes/tutorial_scene.tscn")


func _on_score_button_down():
	get_tree().change_scene_to_file("res://Scenes/highest_score_screen.tscn")


func _on_exit_button_down():
	get_tree().quit()


func _on_pl_button_down():
	TranslationServer.set_locale("pl")
	_update_local()


func _on_uk_button_down():
	TranslationServer.set_locale("en")
	_update_local()
