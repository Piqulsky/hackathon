extends Control

var ProgressBar1 :ProgressBar
var ProgressBar2 :ProgressBar
var ProgressBar3 :ProgressBar
var ProgressBar4 :ProgressBar
var ProgressBar5 :ProgressBar

func _ready():
	ProgressBar1 = $GreatPersonProgressBar1
	ProgressBar2 = $GreatPersonProgressBar2
	ProgressBar3 = $GreatPersonProgressBar3
	ProgressBar4 = $GreatPersonProgressBar4
	ProgressBar5 = $GreatPersonProgressBar5

func _process(delta):
	pass

func _on_great_person_progress_button_1_down():
	ProgressBar1.value += ProgressBar1.step


func _on_great_person_progress_button_2_down():
	ProgressBar2.value += ProgressBar2.step


func _on_great_person_progress_button_3_down():
	ProgressBar3.value += ProgressBar3.step


func _on_great_person_progress_button_4_down():
	ProgressBar4.value += ProgressBar4.step


func _on_great_person_progress_button_5_down():
	ProgressBar5.value += ProgressBar5.step
