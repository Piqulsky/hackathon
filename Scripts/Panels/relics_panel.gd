extends Control

var valueLabel :Label

var literatureButton :TextureButton
var artButton :TextureButton
var sculptureButton :TextureButton
var literatureReqLabel :Label
var artReqLabel :Label
var sculptureReqLabel :Label
var literatureCostLabel :Label
var artCostLabel :Label
var sculptureCostLabel :Label

var literatureCost := 10
var artCost := 20
var sculptureCost := 30
var literatureReq := 1
var artReq := 2
var sculptureReq := 3
var literatureCount := 0
var artCount := 0
var sculptureCount := 0

# Called when the node enters the scene tree for the first time.
func _ready():
	valueLabel = $ValueLabel
	literatureButton = $LiteratureTextureButton
	artButton = $ArtTextureButton
	sculptureButton = $SculptureTextureButton
	literatureReqLabel = $LiteratureTextureButton/RequirmentLabel
	artReqLabel = $ArtTextureButton/RequirmentLabel
	sculptureReqLabel = $SculptureTextureButton/RequirmentLabel
	literatureCostLabel = $LiteratureTextureButton/CostLabel
	artCostLabel = $ArtTextureButton/CostLabel
	sculptureCostLabel = $SculptureTextureButton/CostLabel


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	valueLabel.text = str(Global.savedRelics)
	literatureCostLabel.text = str(Global.resources.gold) + "/" + str(literatureCost)
	artCostLabel.text = str(Global.resources.science) + "/" +str(artCost)
	sculptureCostLabel.text = str(Global.resources.materials) + "/" +str(sculptureCost)
	if Global.amountOfResearchDone < literatureReq:
		literatureButton.disabled = true
	elif literatureCost != 100:
		literatureButton.disabled = false
	if Global.amountOfResearchDone < artReq:
		artButton.disabled = true
	elif artCost != 100:
		artButton.disabled = false
	if Global.amountOfResearchDone < sculptureReq:
		sculptureButton.disabled = true
	elif sculptureCost != 100:
		sculptureButton.disabled = false
	


func _on_literature_texture_button_button_down():
	if Global.amountOfResearchDone >= literatureReq and Global.resources.gold >= literatureCost:
		Global.resources.gold -= literatureCost
		literatureCount += 1
		Global.savedRelics += Global.LITERATURE_INCREASE*Global.savedRelictsMultiplier
		if literatureCount == 5:
			if literatureCost == 100:
				literatureButton.disabled = true
				return
			literatureCount = 0
			literatureCost += Global.LITERATURE_INCREASE*10
			literatureReq += Global.LITERATURE_INCREASE
			var tmpText = ""
			if literatureReq < 5:
				tmpText = " poziomy rozwoju"
			else:
				tmpText = " poziomów rozwojów" 
			literatureReqLabel.text = str(literatureReq) + tmpText


func _on_art_texture_button_button_down():
	if Global.amountOfResearchDone >= artReq and Global.resources.science >= artCost:
		Global.resources.science -= artCost
		artCount += 1
		Global.savedRelics += Global.ART_INCREASE*Global.savedRelictsMultiplier
		if artCount == 5:
			if artCost == 100:
				artButton.disabled = true
				return
			artCount = 0
			artCost += Global.ART_INCREASE*10
			artReq += Global.ART_INCREASE
			var tmpText = ""
			if artReq < 5:
				tmpText = " poziomy rozwoju"
			else:
				tmpText = " poziomów rozwojów" 
			artReqLabel.text = str(artReq) + tmpText


func _on_sculpture_texture_button_button_down():
	if Global.amountOfResearchDone >= sculptureReq and Global.resources.materials >= sculptureCost:
		Global.resources.materials -= sculptureCost
		sculptureCount += 1
		Global.savedRelics += Global.SCULPTURE_INCREASE*Global.savedRelictsMultiplier
		if sculptureCount == 5:
			if sculptureCost >= 100:
				sculptureButton.disabled = true
				return
			sculptureCount = 0
			sculptureCost += Global.SCULPTURE_INCREASE*10
			sculptureReq += Global.SCULPTURE_INCREASE
			if sculptureReq == 12:
				sculptureReq = 10
			var tmpText = ""
			if sculptureReq < 5:
				tmpText = " poziomy rozwoju"
			else:
				tmpText = " poziomów rozwojów" 
			sculptureReqLabel.text = str(sculptureReq) + tmpText


func _on_timer_timeout():
	Global.savedRelics += Global.passiveSavedRelics
