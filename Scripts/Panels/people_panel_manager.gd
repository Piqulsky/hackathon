extends Control

var ProgressBar1 :ProgressBar
var ProgressBar2 :ProgressBar
var ProgressBar3 :ProgressBar
var ProgressBar4 :ProgressBar
var ProgressBar5 :ProgressBar

var Button1 :TextureButton
var Button2 :TextureButton
var Button3 :TextureButton
var Button4 :TextureButton
var Button5 :TextureButton

func _ready():
	ProgressBar1 = $GreatPersonProgressBar1
	ProgressBar2 = $GreatPersonProgressBar2
	ProgressBar3 = $GreatPersonProgressBar3
	ProgressBar4 = $GreatPersonProgressBar4
	ProgressBar5 = $GreatPersonProgressBar5
	Button1 = $GreatPersonProgressButton1
	Button2 = $GreatPersonProgressButton2
	Button3 = $GreatPersonProgressButton3
	Button4 = $GreatPersonProgressButton4
	Button5 = $GreatPersonProgressButton5

func _process(delta):
	pass

func _on_great_person_progress_button_1_down():
	ProgressBar1.value += ProgressBar1.step


func _on_great_person_progress_button_2_down():
	ProgressBar2.value += ProgressBar2.step


func _on_great_person_progress_button_3_down():
	ProgressBar3.value += ProgressBar3.step


func _on_great_person_progress_button_4_down():
	if ProgressBar4.value < 99 and Global.resources.materials >= 50 and Global.resources.science >= 50 and Global.resources.gold >= 50:
		ProgressBar4.value += ProgressBar4.step
		Global.resources.materials -= 50
		Global.resources.science -= 50
		Global.resources.gold -= 50
		
		if ProgressBar4.value == 99:
			Button4.disabled = true
			Global.passiveSavedRelics += 0.25
			#change graphic for higlight


func _on_great_person_progress_button_5_down():
	if ProgressBar5.value < 99 and Global.resources.materials >= 50 and Global.resources.science >= 50 and Global.resources.gold >= 50:	
		ProgressBar5.value += ProgressBar5.step
		Global.resources.materials -= 50
		Global.resources.science -= 50
		Global.resources.gold -= 50
		
		if ProgressBar5.value == 99:
			Button5.disabled = true
			Global.passiveFoodIncome += 0.25
			#change graphic for higlight
