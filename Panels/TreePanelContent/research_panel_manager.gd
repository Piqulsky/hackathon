extends Control

const costOfLevel1Tech := 1000
const costOfLevel2Tech := 2000
const costOfLevel3Tech := 4000
const costOflevel4Tech := 8000 

var unlockingTech4 = 0;

var TechnologyButton1 :TextureButton
var TechnologyButton2 :TextureButton
var TechnologyButton3 :TextureButton
var TechnologyButton4 :TextureButton
var TechnologyButton11 :TextureButton
var TechnologyButton12 :TextureButton
var TechnologyButton21 :TextureButton
var TechnologyButton22 :TextureButton
var TechnologyButton31 :TextureButton
var TechnologyButton32 :TextureButton


func _ready():
	TechnologyButton1 = $TechnologyButton1
	TechnologyButton2 = $TechnologyButton2
	TechnologyButton3 = $TechnologyButton3
	TechnologyButton4 = $TechnologyButton4
	TechnologyButton11 = $TechnologyButton11
	TechnologyButton12 = $TechnologyButton12
	TechnologyButton21 = $TechnologyButton21
	TechnologyButton22 = $TechnologyButton22
	TechnologyButton31 = $TechnologyButton31
	TechnologyButton32 = $TechnologyButton32
	

func _process(delta):
	pass

#village workforce enrollment 1
func _on_technology_button_1_down():
	if Global.resources.science >= costOfLevel1Tech and Global.researchProgress.res1 == false:
		Global.researchProgress.res1 = true
		Global.amountOfResearchDone += 1
		Global.resources.science -= costOfLevel1Tech
		TechnologyButton2.disabled = false
		TechnologyButton11.disabled = false
		TechnologyButton12.disabled = false
		TechnologyButton1.disabled = true
		Global.villagerWorkMultiplier += 0.5

#village workforce enrollment 2
func _on_technology_button_2_down():
	if Global.resources.science >= costOfLevel2Tech and Global.researchProgress.res2 == false:
		Global.researchProgress.res2 = true
		Global.amountOfResearchDone += 1
		Global.resources.science -= costOfLevel2Tech
		TechnologyButton3.disabled = false
		TechnologyButton21.disabled = false
		TechnologyButton22.disabled = false
		TechnologyButton2.disabled = true
		Global.villagerWorkMultiplier += 1

#village workforce enrollment 3
func _on_technology_button_3_down():
	if Global.resources.science >= costOfLevel3Tech and Global.researchProgress.res3 == false:
		Global.researchProgress.res3 = true
		Global.amountOfResearchDone += 1
		Global.resources.science -= costOfLevel3Tech
		unlockingTech4 += 1
		TechnologyButton31.disabled = false
		TechnologyButton32.disabled = false
		TechnologyButton3.disabled = true
		Global.villagerWorkMultiplier += 1
		if unlockingTech4 == 3:
			TechnologyButton4.disabled = true

#village workforce enrollment 4
func _on_technology_button_4_down():
	if Global.resources.science >= costOflevel4Tech and Global.researchProgress.res4 == false:
		Global.researchProgress.res4 = true
		Global.amountOfResearchDone += 1
		Global.resources.science -= costOflevel4Tech
		TechnologyButton4.disabled = true
		Global.villagerWorkMultiplier += 2

#Taxes
func _on_technology_button_11_down():
	if Global.resources.science >= costOfLevel1Tech and Global.researchProgress.res11 == false:
		Global.researchProgress.res11 = true
		Global.amountOfResearchDone += 1
		Global.resources.science -= costOfLevel1Tech
		TechnologyButton11.disabled = true
		Global.passiveGoldIncome += 5

#Mandatory Free of pay work
func _on_technology_button_12_down():
	if Global.resources.science >= costOfLevel1Tech and Global.researchProgress.res12 == false:
		Global.researchProgress.res12 = true
		Global.amountOfResearchDone += 1
		Global.resources.science -= costOfLevel1Tech
		TechnologyButton12.disabled = true
		Global.passiveMaterialsIncome += 5

#Preserving Art
func _on_technology_button_21_down():
	if Global.resources.science >= costOfLevel2Tech and Global.researchProgress.res21 == false:
		Global.researchProgress.res21 = true
		Global.amountOfResearchDone += 1
		Global.resources.science -= costOfLevel2Tech
		TechnologyButton21.disabled = true
		Global.savedRelictsMultiplier += 0.25

#Recruitment of Scientists
func _on_technology_button_22_down():
	if Global.resources.science >= costOfLevel2Tech and Global.researchProgress.res22 == false:
		Global.researchProgress.res22 = true
		Global.amountOfResearchDone += 1
		Global.resources.science -= costOfLevel2Tech
		TechnologyButton22.disabled = true
		Global.passiveScienceIncome += 10

#Automatic Shelter Builder
func _on_technology_button_31_down():
	if Global.resources.science >= costOfLevel3Tech and Global.researchProgress.res31 == false:
		Global.researchProgress.res31 = true
		Global.amountOfResearchDone += 1
		Global.resources.science -= costOfLevel3Tech
		TechnologyButton31.disabled = true
		unlockingTech4 += 1
		
		if unlockingTech4 == 3:
			TechnologyButton4.disabled = true
