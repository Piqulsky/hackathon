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
const LITERATURE_INCREASE := 1
const ART_INCREASE := 2
const SCULPTURE_INCREASE := 3
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
func _process(delta):
	pass


func _on_literature_texture_button_button_down():
	if Global.amountOfResearchDone >= literatureReq and Global.resources.gold >= literatureCost:
		Global.resources.gold -= literatureCost
		literatureCount += 1
		Global.savedRelics += LITERATURE_INCREASE
		valueLabel.text = str(Global.savedRelics)
		if literatureCount == 5:
			if literatureCost == 100:
				literatureButton.disabled = true
				return
			literatureCount = 0
			literatureCost += LITERATURE_INCREASE*10
			literatureCostLabel.text = str(literatureCost)
			literatureReq += LITERATURE_INCREASE
			var tmpText = ""
			if literatureReq < 5:
				tmpText = " rozwoje"
			else:
				tmpText = " rozwojów" 
			literatureReqLabel.text = str(literatureReq) + tmpText


func _on_art_texture_button_button_down():
	if Global.amountOfResearchDone >= artReq and Global.resources.gold >= artCost:
		Global.resources.gold -= artCost
		artCount += 1
		Global.savedRelics += ART_INCREASE
		valueLabel.text = str(Global.savedRelics)
		if artCount == 5:
			if artCost == 100:
				artButton.disabled = true
				return
			artCount = 0
			artCost += ART_INCREASE*10
			artCostLabel.text = str(artCost)
			artReq += ART_INCREASE
			var tmpText = ""
			if artReq < 5:
				tmpText = " rozwoje"
			else:
				tmpText = " rozwojów" 
			artReqLabel.text = str(artReq) + tmpText


func _on_sculpture_texture_button_button_down():
	if Global.amountOfResearchDone >= sculptureReq and Global.resources.gold >= sculptureCost:
		Global.resources.gold -= sculptureCost
		sculptureCount += 1
		Global.savedRelics += SCULPTURE_INCREASE
		valueLabel.text = str(Global.savedRelics)
		if sculptureCount == 5:
			if sculptureCost >= 100:
				sculptureButton.disabled = true
				return
			sculptureCount = 0
			sculptureCost += SCULPTURE_INCREASE*10
			sculptureCostLabel.text = str(sculptureCost)
			sculptureReq += SCULPTURE_INCREASE
			if sculptureReq == 12:
				sculptureReq = 10
			var tmpText = ""
			if sculptureReq < 5:
				tmpText = " rozwoje"
			else:
				tmpText = " rozwojów" 
			sculptureReqLabel.text = str(sculptureReq) + tmpText
