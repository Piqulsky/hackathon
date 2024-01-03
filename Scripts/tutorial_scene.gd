extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	_update_local()

func _update_local():
	$SkipButton.text = tr("TUTORIAL_SKIP")
	$NextButton.text = tr("TUTORIAL_NEXT")
	$Tutorials/Tutorial0/Label.text = tr("TUTORIAL_STORY")
	$Tutorials/Tutorial1/Label.text = tr("TUTORIAL_0")
	$Tutorials/Tutorial1/Label2.text = tr("TUTORIAL_1")
	$Tutorials/Tutorial2/Label.text = tr("TUTORIAL_2")
	
	$Tutorials/Tutorial2/Results/MasterStats/SavedLabel.text = "0"+tr("FILL_SAVED_MLN")
	$Tutorials/Tutorial2/Results/MasterStats/HeritageLabel.text = "0"+tr("FILL_SAVED_HERITAGE")
	$Tutorials/Tutorial2/Results/RightStats/ShelterLabel.tooltip_text = tr("TOOLTIP_SHELTERS")
	$Tutorials/Tutorial2/Results/RightStats/ExpansionLabel.tooltip_text = tr("TOOLTIP_EXPANSIONS")
	$Tutorials/Tutorial2/Results/RightStats/PeopleLabel.tooltip_text = tr("TOOLTIP_SHELTERED")
	$Tutorials/Tutorial2/Results/RightStats/RationsLabel.tooltip_text = tr("TOOLTIP_RATIONS")
	$Tutorials/Tutorial2/Results/RightStats/HungryCount.tooltip_text = tr("TOOLTIP_HUNGRY")
	$Tutorials/Tutorial2/Results/LeftStats/IdolsLabel.tooltip_text = tr("TOOLTIP_GREAT")
	$Tutorials/Tutorial2/Results/LeftStats/ResearchLabel.tooltip_text = tr("TOOLTIP_RESEARCH")
	$Tutorials/Tutorial2/Results/LeftStats/CultureLabel.tooltip_text = tr("TOOLTIP_RELICS")
	$Tutorials/Tutorial2/Results/LeftStats/TechLabel.tooltip_text = tr("TOOLTIP_TECHNOLOGY")
	
	$Tutorials/Tutorial3/Label.text = tr("TUTORIAL_3")
	$Tutorials/Tutorial3/Label2.text = tr("TUTORIAL_4")
	
	$Tutorials/Tutorial3/Control/ResourcesLabel.text = tr("RESOURCES_TITLE")
	$Tutorials/Tutorial3/Control2/Label.text = tr("SHELTERS_TITLE")
	
	$Tutorials/Tutorial4/Label.text = tr("TUTORIAL_5")
	$Tutorials/Tutorial4/Label2.text = tr("TUTORIAL_6")
	
	$Tutorials/Tutorial4/RelicsLabel.text = tr("RELICS_TITLE")
	$Tutorials/Tutorial4/Control2/TechLabel2.text = tr("TECHNOLOGY_TITLE")
	$Tutorials/Tutorial4/ArtTextureButton/RequirmentLabel.text = "1" + tr("RELICS_FILL")
	$Tutorials/Tutorial4/SculptureTextureButton/RequirmentLabel.text = "2" + tr("RELICS_FILL_NUMCASE")
	$Tutorials/Tutorial4/LiteratureTextureButton/RequirmentLabel.text = "3" + tr("RELICS_FILL_NUMCASE")
	
	$Tutorials/Tutorial5/Label.text = tr("TUTORIAL_7")
	$Tutorials/Tutorial5/Label2.text = tr("TUTORIAL_8")
	
	$Tutorials/Tutorial5/Control/EconomyPanelTitle.text = tr("ECONOMY_TITLE")
	$Tutorials/Tutorial5/Control2/ResearchPanelTitle.text = tr("RESEARCH_TITLE")
	
	$Tutorials/Tutorial6/Label.text = tr("TUTORIAL_9")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
