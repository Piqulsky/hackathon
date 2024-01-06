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
	_update_local()

func _update_local():
	$RelicsLabel.text = tr("RELICS_TITLE")
	$LiteratureTextureButton/RequirmentLabel.text = "1"+tr("RELICS_FILL")
	$ArtTextureButton/RequirmentLabel.text = "2"+tr("RELICS_FILL_NUMCASE")
	$SculptureTextureButton/RequirmentLabel.text = "3"+tr("RELICS_FILL_NUMCASE")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	valueLabel.text = str(Global.savedRelics)
	literatureCostLabel.text = str(Global.resources.gold) + "/" + str(literatureCost)
	artCostLabel.text = str(Global.resources.science) + "/" +str(artCost)
	sculptureCostLabel.text = str(Global.resources.materials) + "/" +str(sculptureCost)
	if Global.amountOfResearchDone < literatureReq and literatureReq < 11:
		literatureButton.disabled = true
	elif literatureCost > 100:
		literatureButton.disabled = false
		literatureCostLabel.text = "Max."
	else:
		literatureButton.disabled = false
	if Global.amountOfResearchDone < artReq and artReq < 11:
		artButton.disabled = true
	elif artCost > 100:
		artButton.disabled = false
		artCostLabel.text = "Max."
	else:
		artButton.disabled = false
	if Global.amountOfResearchDone < sculptureReq and sculptureReq < 11:
		sculptureButton.disabled = true
	elif sculptureCost > 120:
		sculptureButton.disabled = false
		sculptureCostLabel.text = "Max."
	else:
		sculptureButton.disabled = false
	


func _on_literature_texture_button_button_down():
	if Global.amountOfResearchDone >= literatureReq and Global.resources.gold >= literatureCost:
		Global.resources.gold -= literatureCost
		literatureCount += 1
		Global.savedRelics += Global.LITERATURE_INCREASE*Global.savedRelictsMultiplier
		if literatureCount == 5:
			literatureCount = 0
			literatureCost += Global.LITERATURE_INCREASE*10
			literatureReq += Global.LITERATURE_INCREASE
			if literatureReq > 10:
				literatureReqLabel.text = ""
				return
			var tmpText = ""
			if literatureReq < 5:
				tmpText = tr("RELICS_FILL_NUMCASE")
			else:
				tmpText = tr("RELICS_FILL_MULTCASE")
			literatureReqLabel.text = str(literatureReq) + tmpText


func _on_art_texture_button_button_down():
	if Global.amountOfResearchDone >= artReq and Global.resources.science >= artCost:
		Global.resources.science -= artCost
		artCount += 1
		Global.savedRelics += Global.ART_INCREASE*Global.savedRelictsMultiplier
		if artCount == 5:
			artCount = 0
			artCost += Global.ART_INCREASE*10
			artReq += Global.ART_INCREASE
			if artReq > 10:
				artReqLabel.text = ""
				return
			var tmpText = ""
			if artReq < 5:
				tmpText = tr("RELICS_FILL_NUMCASE")
			else:
				tmpText = tr("RELICS_FILL_MULTCASE")
			artReqLabel.text = str(artReq) + tmpText


func _on_sculpture_texture_button_button_down():
	if Global.amountOfResearchDone >= sculptureReq and Global.resources.materials >= sculptureCost:
		Global.resources.materials -= sculptureCost
		sculptureCount += 1
		Global.savedRelics += Global.SCULPTURE_INCREASE*Global.savedRelictsMultiplier
		if sculptureCount == 5:
			sculptureCount = 0
			sculptureCost += Global.SCULPTURE_INCREASE*10
			sculptureReq += Global.SCULPTURE_INCREASE
			if sculptureReq == 12:
				sculptureReq = 10
			if sculptureReq > 10:
				print(Global.amountOfResearchDone)
				print(sculptureReq)
				sculptureReqLabel.text = ""
				return
			var tmpText = ""
			if sculptureReq < 5:
				tmpText = tr("RELICS_FILL_NUMCASE")
			else:
				tmpText = tr("RELICS_FILL_MULTCASE")
			sculptureReqLabel.text = str(sculptureReq) + tmpText


func _on_timer_timeout():
	if Global.passivlySavedRelics < 50:
		Global.savedRelics += Global.passiveSavedRelics
		Global.passivlySavedRelics += Global.passiveSavedRelics
		if Global.passivlySavedRelics > 50:
			Global.passiveSavedRelics = 0.0
			Global.savedRelics = Global.savedRelics - (Global.passivlySavedRelics - 50)
			Global.passivlySavedRelics = 50
