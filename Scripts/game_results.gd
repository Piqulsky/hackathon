extends Control

var sheltersLabel :Label
var expansionsLabel :Label
var peopleLabel :Label
var foodLabel :Label
var hungryLabel :Label
var researchLabel :Label
var idolsLabel :Label
var cultureLabel :Label
var techLabel :Label

var savedLabel :Label
var heritageLabel :Label

# Called when the node enters the scene tree for the first time.
func _ready():
	sheltersLabel = $ShelterStats/PeopleCountLabel
	expansionsLabel = $ShelterStats/ExpansionCountLabel
	peopleLabel = $ShelterStats/PeopleCountLabel
	foodLabel = $FoodStats/RationsCountLabel
	hungryLabel = $FoodStats/PeopleCountLabel
	researchLabel = $ResearchStats/ResearchLevels
	idolsLabel = $ResearchStats/IdolsLevels
	cultureLabel = $HeritageStats/CultureCountLabel
	techLabel = $HeritageStats/PeopleCountLabel
	savedLabel = $MasterStats/SavedLabel
	heritageLabel = $MasterStats/HeritageLabel


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var people = Global.shelters * 1.5 * (Global.shelterExpansions+1)
	sheltersLabel.text = str(Global.shelters)
	expansionsLabel.text = str(Global.shelterExpansions)
	peopleLabel.text = str(people)
	foodLabel.text = str(Global.food)
	var hungry = people - Global.food * 0.2
	if hungry < 0:
		hungry = 0
	hungryLabel.text = str(hungry)
	researchLabel.text = str(Global.amountOfResearchDone)
	idolsLabel.text = str(Global.completedIdols)
	cultureLabel.text = str(Global.savedRelics)
	techLabel.text = str(Global.savedTech)
	savedLabel.text = str(people - hungry) + " milionów uratowanych ludzi"
	var heritage = int((Global.completedIdols/5 + Global.savedRelics/150 + Global.savedTech/6)/3 * 100)
	heritageLabel.text = str(heritage) + "% ocalonego dziedzictwa"
