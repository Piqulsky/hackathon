extends Control

var sheltersLabel :Label
var expansionsLabel :Label
var foodLabel :Label
var cultureLabel :Label
var techLabel :Label
var idolsLabel :Label
var peopleLabel :Label
var heritageLabel :Label

var nameTextEdit :TextEdit
var people := 0
var heritage := 0

var hospital :Sprite2D
var bank :Sprite2D
var factory :Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	sheltersLabel = $Scores/ShelterLabel
	expansionsLabel = $Scores/ExpansionsLabel
	foodLabel = $Scores/FoodLabel
	cultureLabel = $Scores/CultureLabel
	techLabel = $Scores/TechLabel
	idolsLabel = $Scores/IdolsLabel
	peopleLabel = $Final/PeopleLabel
	heritageLabel = $Final/HeritageLabel
	nameTextEdit = $Save/NameTextEdit
	hospital = $Hospitalend
	bank = $Bankend
	factory = $Fabrykaend
	_update_local()

func _update_local():
	$EndGameLabel.text = tr("END_TITLE")
	sheltersLabel.text = "0" + tr("END_SHELTERS")
	expansionsLabel.text = "0" + tr("END_EXPANSIONS")
	foodLabel.text = "0" + tr("END_RATIONS")
	idolsLabel.text = "0" + tr("END_RELICS")
	cultureLabel.text = "0" + tr("END_TECHNOLOGY")
	techLabel.text = "0" + tr("END_GREAT")
	peopleLabel.text = "0" + tr("END_SAVED")
	heritageLabel.text = "0" + tr("END_HERITAGE")
	$Save/NameLabel.text = tr("END_NAME")
	$Save/NameTextEdit.placeholder_text = tr("SCORE_NAME") + "..."
	$Save/SaveButton.text = tr("END_SCORE")
	$Save/ExitButton.text = tr("END_EXIT")

func _physics_process(delta):
	if(Global.factoryVisible):
		factory.visible = true
	if(Global.hospitalVisible):
		hospital.visible = true
	if(Global.bankVisibile):
		bank.visible = true

func end_game():
	visible = true
	people = Global.shelters * 1.5 * (Global.shelterExpansions+1)
	sheltersLabel.text = str(Global.shelters) + tr("END_SHELTERS")
	expansionsLabel.text = str(Global.shelterExpansions) + tr("END_EXPANSIONS")
	foodLabel.text = str(int(Global.food)) + tr("END_RATIONS")
	idolsLabel.text = str(Global.completedIdols) + tr("END_GREAT")
	cultureLabel.text = str(Global.savedRelics) + tr("END_TECHNOLOGY")
	techLabel.text = str(Global.savedTech) + tr("END_RELICS")
	var hungry = people - Global.food * 0.3
	if hungry < 0:
		hungry = 0
	peopleLabel.text = str(people - hungry) + tr("END_SAVED")
	var heritage = int((Global.completedIdols * 4) + (Global.savedRelics/5) + (Global.savedTech * 5))
	heritageLabel.text = str(heritage) + tr("END_HERITAGE")
	Global.reset()

func _on_save_button_button_down():
	if not nameTextEdit.text.is_empty():
		Global.stats.append({
			"name": nameTextEdit.text,
			"people": people,
			"heritage": heritage
		})
		
		var save_game = FileAccess.open("user://score.save", FileAccess.WRITE)
		save_game.store_line(JSON.stringify(Global.stats))
		print(JSON.stringify(Global.stats))
		
		get_tree().change_scene_to_file("res://Scenes/start_scene.tscn")

func _on_exit_button_button_down():
	get_tree().change_scene_to_file("res://Scenes/start_scene.tscn")
