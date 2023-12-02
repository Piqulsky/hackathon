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

var MaterialsPriceLabel :Label
var GoldPriceLabel :Label
var ResearchPriceLabel :Label

func _ready():
	MaterialUpgradeButton = $MaterialsUpgradeButton
	GoldUpgradeButton = $GoldUpgradeButton
	ResearchUpgradeButton = $ResearchUpgradeButton
	
	MaterialsPriceLabel = $MaterialsUpgradeButton/MaterialsPriceLabel
	GoldPriceLabel = $GoldUpgradeButton/GoldPriceLabel
	ResearchPriceLabel = $ResearchUpgradeButton/ResearchPriceLabel
	
	MaterialsPriceLabel.text = "0/100"
	GoldPriceLabel.text = "0/100"
	ResearchPriceLabel.text = "0/100"

func _physics_process(delta):
	if amountOfMaterialUpgrades < 5:
		MaterialsPriceLabel.text = str(Global.resources.materials)+"/"+str(costOfMaterialsUpgrade)
	elif amountOfMaterialUpgrades == 5:
		MaterialsPriceLabel.text = ""
	if amountOfGoldUpgrades < 5:
		GoldPriceLabel.text = str(Global.resources.gold)+"/"+str(castOfGoldUpgrade)
	elif amountOfGoldUpgrades == 5:
		GoldPriceLabel.text = ""
	if amountOfResearchUpgrades < 5:
		ResearchPriceLabel.text = str(Global.resources.science)+"/"+str(costOfResearchUpgrade)
	elif amountOfResearchUpgrades == 5:
		ResearchPriceLabel.text = ""

func _on_materials_upgrade_button_down():
	if Global.resources.materials >= costOfMaterialsUpgrade and amountOfMaterialUpgrades < 5:
		Global.resourcesMultiplier.materials += (costOfMaterialsUpgrade/100)
		Global.resources.materials -= costOfMaterialsUpgrade
		costOfMaterialsUpgrade *= 2
		amountOfMaterialUpgrades += 1
	if amountOfMaterialUpgrades == 3:
		Global.factoryVisible = true
	if amountOfMaterialUpgrades == 5:
		MaterialUpgradeButton.disabled = true


func _on_gold_upgrade_button_down():
	if Global.resources.gold >= castOfGoldUpgrade and amountOfGoldUpgrades < 5:
		Global.resourcesMultiplier.gold += (castOfGoldUpgrade/100)
		Global.resources.gold -= castOfGoldUpgrade
		castOfGoldUpgrade *= 2
		amountOfGoldUpgrades += 1
	if amountOfGoldUpgrades == 3:
		Global.bankVisibile = true
	if amountOfGoldUpgrades == 5:
		GoldUpgradeButton.disabled = true


func _on_research_upgrade_button_down():
	if Global.resources.science >= costOfResearchUpgrade and amountOfResearchUpgrades < 5:
		Global.resourcesMultiplier.science += (costOfResearchUpgrade/100)
		Global.resources.science -= costOfResearchUpgrade
		costOfResearchUpgrade *= 2
		amountOfResearchUpgrades += 1
	if amountOfResearchUpgrades == 3:
		Global.hospitalVisible = true
	if amountOfResearchUpgrades == 5:
		ResearchUpgradeButton.disabled = true
