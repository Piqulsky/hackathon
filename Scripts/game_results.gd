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


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var people = Global.shelters * 1.5 * (Global.shelterExpansions+1)
	sheltersCount.text = str(Global.shelters)
	expansionsCount.text = str(Global.shelterExpansions)
	peopleCount.text = str(people) + "mln"
	foodCount.text = str(Global.food) + "mln"
	var hungry = people - Global.food * 0.2 
	if hungry < 0:
		hungry = 0
	hungryCount.text = str(int(hungry)) + "mln"
	researchCount.text = str(Global.amountOfResearchDone)
	idolsCount.text = str(Global.completedIdols)
	cultureCount.text = str(Global.savedRelics)
	techCount.text = str(Global.savedTech)
	savedLabel.text = str(people - hungry) + " milionów uratowanych ludzi"
	var heritage = int((Global.completedIdols/5 + Global.savedRelics/150 + Global.savedTech/6)/3 * 100)
	heritageLabel.text = str(heritage) + "% ocalonego dziedzictwa"
