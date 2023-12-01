extends Control

var costOfMaterialsUpgrade = 100
var castOfGoldUpgrade = 100
var costOfResearchUpgrade = 100

func _ready():
	pass

func _process(delta):
	pass


func _on_materials_upgrade_button_down():
	if Global.resources.science >= costOfMaterialsUpgrade:
		Global.resourcesMultiplier.materials += (costOfMaterialsUpgrade/100)
		costOfMaterialsUpgrade *= 2


func _on_gold_upgrade_button_down():
	pass 


func _on_research_upgrade_button_down():
	pass 
