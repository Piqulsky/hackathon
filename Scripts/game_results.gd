extends Control

var sheltersCount :Label
var expansionsCount :Label
var peopleCount :Label
var foodCount :Label
var hungryCount :Label
var researchCount :Label
var idolsCount :Label
var cultureCount :Label
var techCount :Label

var savedLabel :Label
var heritageLabel :Label

# Called when the node enters the scene tree for the first time.
func _ready():
	sheltersCount = $RightStats/ShelterCountLabel
	expansionsCount = $RightStats/ExpansionCountLabel
	peopleCount = $RightStats/PeopleCountLabel
	foodCount = $RightStats/RationsCountLabel
	hungryCount = $RightStats/HungryCountLabel
	researchCount = $LeftStats/ResearchCountLabel
	idolsCount = $LeftStats/IdolsCountLabel
	cultureCount = $LeftStats/CultureCountLabel
	techCount = $LeftStats/TechCountLabel
	savedLabel = $MasterStats/SavedLabel
	heritageLabel = $MasterStats/HeritageLabel
	_update_local()

func _update_local():
	savedLabel.text = "0"+tr("FILL_SAVED_MLN")
	heritageLabel.text = "0"+tr("FILL_SAVED_HERITAGE")
	$RightStats/ShelterLabel.tooltip_text = tr("TOOLTIP_SHELTERS")
	$RightStats/ExpansionLabel.tooltip_text = tr("TOOLTIP_EXPANSIONS")
	$RightStats/PeopleLabel.tooltip_text = tr("TOOLTIP_SHELTERED")
	$RightStats/RationsLabel.tooltip_text = tr("TOOLTIP_RATIONS")
	$RightStats/HungryCount.tooltip_text = tr("TOOLTIP_HUNGRY")
	
	$LeftStats/IdolsLabel.tooltip_text = tr("TOOLTIP_GREAT")
	$LeftStats/ResearchLabel.tooltip_text = tr("TOOLTIP_RESEARCH")
	$LeftStats/CultureLabel.tooltip_text = tr("TOOLTIP_RELICS")
	$LeftStats/TechLabel.tooltip_text = tr("TOOLTIP_TECHNOLOGY")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var people = Global.shelters * 1.5 * (Global.shelterExpansions+1)
	sheltersCount.text = str(Global.shelters)
	expansionsCount.text = str(Global.shelterExpansions)
	peopleCount.text = str(people) + "mln"
	foodCount.text = str(Global.food) + "mln"
	var hungry = people - Global.food * 0.3 
	if hungry < 0:
		hungry = 0
	hungryCount.text = str(int(hungry)) + "mln"
	if hungry > 0 and hungry < 1:
		hungryCount.text = "~1mln"
	researchCount.text = str(Global.amountOfResearchDone)
	idolsCount.text = str(Global.completedIdols)
	cultureCount.text = str(Global.savedRelics)
	techCount.text = str(Global.savedTech)
	savedLabel.text = str(people - hungry) + tr("FILL_SAVED_MLN")
	var heritage = int((Global.completedIdols * 4) + (Global.savedRelics/5) + (Global.savedTech * 5))
	heritageLabel.text = str(heritage) + tr("FILL_SAVED_HERITAGE")
