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


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func end_game():
	visible = true
	people = Global.shelters * 1.5 * (Global.shelterExpansions+1)
	sheltersLabel.text = str(Global.shelters) + " wybudowanych schronisk"
	expansionsLabel.text = str(Global.shelterExpansions) + " wybudowanych powiększeń schronisk"
	foodLabel.text = str(Global.food) + " wyprodukowanych racji żywnościowych"
	idolsLabel.text = str(Global.completedIdols) + " zabezpieczonych zabytków kultury"
	cultureLabel.text = str(Global.savedRelics) + " zachowanych przełomów technologicznych"
	techLabel.text = str(Global.savedTech) + " ochronionych wielkich ludzi"
	var hungry = people - Global.food * 0.2
	if hungry < 0:
		hungry = 0
	peopleLabel.text = str(people - hungry) + " milionów uratowanych od śmierci ludzi"
	heritage = int((Global.completedIdols/5 + Global.savedRelics/150 + Global.savedTech/6)/3 * 100)
	heritageLabel.text = str(heritage) + " % ocalonego historycznego dziedzictwa ludzkości"


func _on_save_button_button_down():
	if not nameTextEdit.text.is_empty():
		Global.stats.append({
			"name": nameTextEdit.text,
			"people": people,
			"heritage": heritage
		})


func _on_exit_button_button_down():
	get_tree().change_scene_to_file("res://Scenes/start_scene.tscn")
