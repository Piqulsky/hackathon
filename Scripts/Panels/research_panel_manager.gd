extends Control

const costOfLevel1Tech := 500
const costOfLevel2Tech := 1000
const costOfLevel3Tech := 2000
const costOflevel4Tech := 4000

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

var Label1 :Label
var Label2 :Label
var Label3 :Label
var Label4 :Label
var Label5 :Label
var Label6 :Label
var Label7 :Label
var Label8 :Label
var Label9 :Label
var Label10 :Label

var MoneyCost1 :Label
var MoneyCost11 :Label
var MoneyCost12 :Label
var MoneyCost2 :Label
var MoneyCost21 :Label
var MoneyCost22 :Label
var MoneyCost3 :Label
var MoneyCost31 :Label
var MoneyCost32 :Label
var MoneyCost4 :Label

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
	Label1 = $TechnologyButton1/Label1
	Label2 = $TechnologyButton2/Label2
	Label3 = $TechnologyButton3/Label3
	Label4 = $TechnologyButton4/Label4
	Label5 = $TechnologyButton11/Label5
	Label6 = $TechnologyButton12/Label6
	Label7 = $TechnologyButton21/Label7
	Label8 = $TechnologyButton22/Label8
	Label9 = $TechnologyButton31/Label9
	Label10 = $TechnologyButton32/Label10
	MoneyCost1 = $TechnologyButton1/MoneyCost1
	MoneyCost11 = $TechnologyButton11/MoneyCost1
	MoneyCost12 = $TechnologyButton12/MoneyCost1
	MoneyCost2 = $TechnologyButton2/MoneyCost2
	MoneyCost21 = $TechnologyButton21/MoneyCost2
	MoneyCost22 = $TechnologyButton22/MoneyCost2
	MoneyCost3 = $TechnologyButton3/MoneyCost3
	MoneyCost31 = $TechnologyButton31/MoneyCost3
	MoneyCost32 = $TechnologyButton32/MoneyCost3
	MoneyCost4 = $TechnologyButton4/MoneyCost4

func _physics_process(delta):
	MoneyCost1.text = str(Global.resources.science)+"/"+str(costOfLevel1Tech)
	MoneyCost11.text = str(Global.resources.science)+"/"+str(costOfLevel1Tech)
	MoneyCost12.text = str(Global.resources.science)+"/"+str(costOfLevel1Tech)
	MoneyCost2.text = str(Global.resources.science)+"/"+str(costOfLevel2Tech)
	MoneyCost21.text = str(Global.resources.science)+"/"+str(costOfLevel2Tech)
	MoneyCost22.text = str(Global.resources.science)+"/"+str(costOfLevel2Tech)
	MoneyCost3.text = str(Global.resources.science)+"/"+str(costOfLevel3Tech)
	MoneyCost31.text = str(Global.resources.science)+"/"+str(costOfLevel3Tech)
	MoneyCost32.text = str(Global.resources.science)+"/"+str(costOfLevel3Tech)
	MoneyCost4.text = str(Global.resources.science)+"/"+str(costOflevel4Tech)

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
		TechnologyButton1.texture_disabled = load("res://Textures/ballsbuy/ballwork1buy.png")
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
		TechnologyButton2.texture_disabled = load("res://Textures/ballsbuy/ballwork2buy.png")
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
		TechnologyButton3.texture_disabled = load("res://Textures/ballsbuy/ballwork3buy.png")
		Global.villagerWorkMultiplier += 1
		if unlockingTech4 == 3:
			TechnologyButton4.disabled = false

#village workforce enrollment 4
func _on_technology_button_4_down():
	if Global.resources.science >= costOflevel4Tech and Global.researchProgress.res4 == false:
		Global.researchProgress.res4 = true
		Global.amountOfResearchDone += 1
		Global.resources.science -= costOflevel4Tech
		TechnologyButton4.disabled = true
		TechnologyButton4.texture_disabled = load("res://Textures/ballsbuy/ballwork4buy.png")
		Global.villagerWorkMultiplier += 2

#Taxes
func _on_technology_button_11_down():
	if Global.resources.science >= costOfLevel1Tech and Global.researchProgress.res11 == false:
		Global.researchProgress.res11 = true
		Global.amountOfResearchDone += 1
		Global.resources.science -= costOfLevel1Tech
		TechnologyButton11.disabled = true
		TechnologyButton11.texture_disabled = load("res://Textures/ballsbuy/balltaxbuy.png")
		Global.passiveGoldIncome += 5

#Mandatory Free of pay work
func _on_technology_button_12_down():
	if Global.resources.science >= costOfLevel1Tech and Global.researchProgress.res12 == false:
		Global.researchProgress.res12 = true
		Global.amountOfResearchDone += 1
		Global.resources.science -= costOfLevel1Tech
		TechnologyButton12.disabled = true
		TechnologyButton12.texture_disabled = load("res://Textures/ballsbuy/ballslavebuy.png")
		Global.passiveMaterialsIncome += 5

#Preserving Art
func _on_technology_button_21_down():
	if Global.resources.science >= costOfLevel2Tech and Global.researchProgress.res21 == false:
		Global.researchProgress.res21 = true
		Global.amountOfResearchDone += 1
		Global.resources.science -= costOfLevel2Tech
		TechnologyButton21.disabled = true
		TechnologyButton21.texture_disabled = load("res://Textures/ballsbuy/ballartbuy.png")
		Global.savedRelictsMultiplier += 0.25

#Recruitment of Scientists
func _on_technology_button_22_down():
	if Global.resources.science >= costOfLevel2Tech and Global.researchProgress.res22 == false:
		Global.researchProgress.res22 = true
		Global.amountOfResearchDone += 1
		Global.resources.science -= costOfLevel2Tech
		TechnologyButton22.disabled = true
		TechnologyButton22.texture_disabled = load("res://Textures/ballsbuy/ballsciencebuy.png")
		Global.passiveScienceIncome += 10

#Automatic Shelter Builder
func _on_technology_button_31_down():
	if Global.resources.science >= costOfLevel3Tech and Global.researchProgress.res31 == false:
		Global.researchProgress.res31 = true
		Global.amountOfResearchDone += 1
		Global.resources.science -= costOfLevel3Tech
		TechnologyButton31.disabled = true
		TechnologyButton31.texture_disabled = load("res://Textures/ballsbuy/ballschron1buy.png")
		unlockingTech4 += 1
		Global.automaticShelterBuilder = true
		if unlockingTech4 == 3:
			TechnologyButton4.disabled = false

#Automatic Shelter Upgrade Builder
func _on_technology_button_32_down():
	if Global.resources.science >= costOfLevel3Tech and Global.researchProgress.res32 == false:
		Global.researchProgress.res32 = true
		Global.amountOfResearchDone += 1
		Global.resources.science -= costOfLevel3Tech
		TechnologyButton32.disabled = true
		TechnologyButton32.texture_disabled = load("res://Textures/ballsbuy/ballschron2buy.png")
		unlockingTech4 += 1
		Global.automaticShelterImprover = true
		if unlockingTech4 == 3:
			TechnologyButton4.disabled = false


func _on_technology_button_1_mouse_entered():
	Label1.visible = true

func _on_technology_button_1_mouse_exited():
	Label1.visible = false

func _on_technology_button_2_mouse_entered():
	Label2.visible = true

func _on_technology_button_2_mouse_exited():
	Label2.visible = false

func _on_technology_button_3_mouse_entered():
	Label3.visible = true

func _on_technology_button_3_mouse_exited():
	Label3.visible = false

func _on_technology_button_4_mouse_entered():
	Label4.visible = true

func _on_technology_button_4_mouse_exited():
	Label4.visible = false

func _on_technology_button_11_mouse_entered():
	Label5.visible = true

func _on_technology_button_11_mouse_exited():
	Label5.visible = false

func _on_technology_button_12_mouse_entered():
	Label6.visible = true

func _on_technology_button_12_mouse_exited():
	Label6.visible = false

func _on_technology_button_21_mouse_entered():
	Label7.visible = true

func _on_technology_button_21_mouse_exited():
	Label7.visible = false

func _on_technology_button_22_mouse_entered():
	Label8.visible = true

func _on_technology_button_22_mouse_exited():
	Label8.visible = false

func _on_technology_button_31_mouse_entered():
	Label9.visible = true

func _on_technology_button_31_mouse_exited():
	Label9.visible = false

func _on_technology_button_32_mouse_entered():
	Label10.visible = true

func _on_technology_button_32_mouse_exited():
	Label10.visible = false
