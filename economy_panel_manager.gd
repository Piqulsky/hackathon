extends Control

var costOfMaterialsUpgrade := 100
var castOfGoldUpgrade := 100
var costOfResearchUpgrade := 100

var amountOfMaterialUpgrades := 0;
var amountOfGoldUpgrades := 0;
var amountOfResearchUpgrades := 0;

var MaterialUpgradeButton :TextureButton
var GoldUpgradeButton :TextureButton
var ResearchUpgradeButton :TextureButton

func _ready():
	MaterialUpgradeButton = $MaterialsUpgradeButton
	GoldUpgradeButton = $GoldUpgradeButton
	ResearchUpgradeButton = $ResearchUpgradeButton

func _process(delta):
	pass


func _on_materials_upgrade_button_down():
	if Global.resources.materials >= costOfMaterialsUpgrade and amountOfMaterialUpgrades < 5:
		Global.resourcesMultiplier.materials += (costOfMaterialsUpgrade/100)
		Global.resources.materials -= costOfMaterialsUpgrade
		costOfMaterialsUpgrade *= 2
		amountOfMaterialUpgrades += 1
		
	if amountOfMaterialUpgrades == 5:
		MaterialUpgradeButton.disabled = true


func _on_gold_upgrade_button_down():
	if Global.resources.gold >= castOfGoldUpgrade and amountOfGoldUpgrades < 5:
		Global.resourcesMultiplier.materials += (castOfGoldUpgrade/100)
		Global.resources.gold -= castOfGoldUpgrade
		castOfGoldUpgrade *= 2
		amountOfGoldUpgrades += 1
		
	if amountOfGoldUpgrades == 5:
		GoldUpgradeButton.disabled = true


func _on_research_upgrade_button_down():
	if Global.resources.science >= costOfResearchUpgrade and amountOfResearchUpgrades < 5:
		Global.resourcesMultiplier.science += (costOfResearchUpgrade/100)
		Global.resources.science -= costOfResearchUpgrade
		costOfResearchUpgrade *= 2
		amountOfResearchUpgrades += 1
		
	if amountOfResearchUpgrades == 5:
		ResearchUpgradeButton.disabled = true
