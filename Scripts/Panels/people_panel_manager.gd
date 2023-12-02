extends Control

const levelCost = 50

var ProgressBar1 :TextureProgressBar
var ProgressBar2 :TextureProgressBar
var ProgressBar3 :TextureProgressBar
var ProgressBar4 :TextureProgressBar
var ProgressBar5 :TextureProgressBar

var Button1 :TextureButton
var Button2 :TextureButton
var Button3 :TextureButton
var Button4 :TextureButton
var Button5 :TextureButton

var Label1 :Label
var Label2 :Label
var Label3 :Label
var Label4 :Label
var Label5 :Label

func _ready():
	ProgressBar1 = $Group1/GreatPersonProgressBar1
	ProgressBar2 = $Group2/GreatPersonProgressBar2
	ProgressBar3 = $Group3/GreatPersonProgressBar3
	ProgressBar4 = $Group4/GreatPersonProgressBar4
	ProgressBar5 = $Group5/GreatPersonProgressBar5
	Button1 = $Group1/GreatPersonProgressButton1
	Button2 = $Group2/GreatPersonProgressButton2
	Button3 = $Group3/GreatPersonProgressButton3
	Button4 = $Group4/GreatPersonProgressButton4
	Button5 = $Group5/GreatPersonProgressButton5
	Label1 = $Group1/GreatPersonProgressButton1/Label1
	Label2 = $Group2/GreatPersonProgressButton2/Label2
	Label3 = $Group3/GreatPersonProgressButton3/Label3
	Label4 = $Group4/GreatPersonProgressButton4/Label4
	Label5 = $Group5/GreatPersonProgressButton5/Label5

func _physics_process(delta):
	if ProgressBar1.value == 99:
		Label1.text = "Maks."
	elif ProgressBar1.value < 99 and ProgressBar1.value >= 60:
		Label1.text = str(Global.resources.science)+"/50"
	elif ProgressBar1.value < 60 and ProgressBar1.value >= 30:
		Label1.text = str(Global.resources.materials)+"/50"
	elif ProgressBar1.value < 30:
		Label1.text = str(Global.resources.gold)+"/50"
	
	if ProgressBar2.value == 99:
		Label2.text = "Maks."
	elif ProgressBar2.value < 99 and ProgressBar2.value >= 60:
		Label2.text = str(Global.resources.materials)+"/50"
	elif ProgressBar2.value < 60 and ProgressBar2.value >= 30:
		Label2.text = str(Global.resources.gold)+"/50"
	elif ProgressBar2.value < 30:
		Label2.text = str(Global.resources.science)+"/50"
	
	if ProgressBar3.value == 99:
		Label3.text = "Maks."
	elif ProgressBar3.value < 99 and ProgressBar3.value >= 60:
		Label3.text = str(Global.resources.gold)+"/50"
	elif ProgressBar3.value < 60 and ProgressBar3.value >= 30:
		Label3.text = str(Global.resources.science)+"/50"
	elif ProgressBar3.value < 30:
		Label3.text = str(Global.resources.materials)+"/50"
	
	if ProgressBar4.value == 99:
		Label4.text = "Maks."
	elif ProgressBar4.value < 99:
		Label4.text = str(Global.resources.materials)+"/50" + " " + str(Global.resources.gold)+"/50" + " " +  str(Global.resources.science)+"/50"
	
	if ProgressBar5.value == 99:
		Label5.text = "Maks."
	elif ProgressBar5.value < 99:
		Label5.text = str(Global.resources.materials)+"/50" + " " + str(Global.resources.gold)+"/50" + " " +  str(Global.resources.science)+"/50"

func _on_great_person_progress_button_1_down():
	if ProgressBar1.value < 99 and ProgressBar1.value >= 60 and Global.resources.science >= 50:
		ProgressBar1.value += ProgressBar1.step
		Global.resources.science -= levelCost
		if ProgressBar1.value == 99:
			Global.passiveMaterialsIncome -= 3
			Global.passiveScienceIncome += 3
			ProgressBar1.texture_over = load("res://Textures/termometr/termometr1glow.png")
			Global.completedIdols += 1
			Button1.disabled = true
	elif ProgressBar1.value < 60 and ProgressBar1.value >= 30 and Global.resources.materials >= 50:
		ProgressBar1.value += ProgressBar1.step
		Global.resources.materials -= levelCost
		if ProgressBar1.value == 60:
			Global.passiveGoldIncome -= 3
			Global.passiveMaterialsIncome += 3
	elif ProgressBar1.value < 30 and Global.resources.gold >= 50:
		ProgressBar1.value += ProgressBar1.step
		Global.resources.gold -= levelCost
		if ProgressBar1.value == 30:
			Global.passiveGoldIncome += 3

func _on_great_person_progress_button_2_down():
	if ProgressBar2.value < 99 and ProgressBar2.value >= 60  and Global.resources.materials >= 50:
		ProgressBar2.value += ProgressBar2.step
		Global.resources.materials -= levelCost
		if ProgressBar2.value == 99:
			Global.passiveGoldIncome -= 3
			Global.passiveMaterialsIncome += 3
			ProgressBar2.texture_over = load("res://Textures/termometr/termometr2glow.png")
			Global.completedIdols += 1
			Button2.disabled = true
	elif ProgressBar2.value < 60 and ProgressBar2.value >= 30  and Global.resources.gold >= 50:
		ProgressBar2.value += ProgressBar2.step
		Global.resources.gold -= levelCost
		if ProgressBar2.value == 60:
			Global.passiveScienceIncome -= 3
			Global.passiveGoldIncome += 3
	elif ProgressBar2.value < 30 and Global.resources.science >= 50:
		ProgressBar2.value += ProgressBar2.step
		Global.resources.science -= levelCost
		if ProgressBar2.value == 30:
			Global.passiveScienceIncome += 3

func _on_great_person_progress_button_3_down():
	if ProgressBar3.value < 99 and ProgressBar3.value >= 60  and Global.resources.gold >= 50:
		ProgressBar3.value += ProgressBar3.step
		Global.resources.gold -= levelCost
		if ProgressBar3.value == 99:
			Global.passiveScienceIncome -= 3
			Global.passiveGoldIncome += 3
			ProgressBar3.texture_over = load("res://Textures/termometr/termometr3glow.png")
			Global.completedIdols += 1
			Button3.disabled = true
	elif ProgressBar3.value < 60 and ProgressBar3.value >= 30  and Global.resources.science >= 50:
		ProgressBar3.value += ProgressBar3.step
		Global.resources.science -= levelCost
		if ProgressBar3.value == 60:
			Global.passiveMaterialsIncome -= 3
			Global.passiveScienceIncome += 3
	elif ProgressBar3.value < 30 and Global.resources.materials >= 50:
		ProgressBar3.value += ProgressBar3.step
		Global.resources.materials -= levelCost
		if ProgressBar3.value == 30:
			Global.passiveMaterialsIncome += 3

func _on_great_person_progress_button_4_down():
	if ProgressBar4.value < 99 and Global.resources.materials >= 50 and Global.resources.science >= 50 and Global.resources.gold >= 50:
		ProgressBar4.value += ProgressBar4.step
		Global.resources.materials -= levelCost
		Global.resources.science -= levelCost
		Global.resources.gold -= levelCost
		
		if ProgressBar4.value == 99:
			Button4.disabled = true
			Global.passiveSavedRelics += 0.25
			ProgressBar4.texture_over = load("res://Textures/termometr/termometr4glow.png")
			Global.completedIdols += 1


func _on_great_person_progress_button_5_down():
	if ProgressBar5.value < 99 and Global.resources.materials >= 50 and Global.resources.science >= 50 and Global.resources.gold >= 50:	
		ProgressBar5.value += ProgressBar5.step
		Global.resources.materials -= levelCost
		Global.resources.science -= levelCost
		Global.resources.gold -= levelCost
		
		if ProgressBar5.value == 99:
			Button5.disabled = true
			Global.passiveFoodIncome += 0.25
			ProgressBar5.texture_over = load("res://Textures/termometr/termometr5glow.png")
			Global.completedIdols += 1
