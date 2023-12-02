extends Control

var buttons:Array[TextureButton] = [] # 0:Materials; 1:Gold; 2:Science; 3:MaterialsGold; 4:GoldScience; 5:Master;
var pgBars:Array[ProgressBar] = [] # 0:Materials; 1:Gold; 2:Science; 3:MaterialsGold; 4:GoldScience; 5:Master;
var costLabels:Array[Label] = [] # 0:Materials; 1:Gold; 2:Science; 3:MaterialsGold; 4:GoldScience; 5:Master;
var costs:Array[int] = [20, 20, 20, 40, 40, 60] # 0:Materials; 1:Gold; 2:Science; 3:MaterialsGold; 4:GoldScience; 5:Master;
var resources:Array[String] = ["materials", "gold", "science"]

# Called when the node enters the scene tree for the first time.
func _ready():
	buttons.append_array([$BasicTech/MaterialsTechButton, $BasicTech/GoldTechButton, $BasicTech/ScienceTechButton, $AdvancedTech/MaterialsGoldTechButton, $AdvancedTech/GoldScienceTechButton, $MasterTech/MasterButton])
	pgBars.append_array([$BasicTech/MaterialsTechButton/TechBar, $BasicTech/GoldTechButton/TechBar, $BasicTech/ScienceTechButton/TechBar, $AdvancedTech/MaterialsGoldTechButton/TechBar, $AdvancedTech/GoldScienceTechButton/TechBar, $MasterTech/MasterButton/TechBar])
	costLabels.append_array([$BasicTech/MaterialsTechButton/CostLabel, $BasicTech/GoldTechButton/CostLabel, $BasicTech/ScienceTechButton/CostLabel, $AdvancedTech/MaterialsGoldTechButton/CostLabel, $AdvancedTech/GoldScienceTechButton/CostLabel, $MasterTech/MasterButton/CostLabel])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for index in len(costLabels):
		var text = ""
		match index:
			0, 1, 2:
				text = str(Global.resources[resources[index]]) + "/" + str(costs[index])
			3:
				text = str(Global.resources[resources[0]]) + "/" + str(costs[index]) + "   " + str(Global.resources[resources[1]]) + "/" + str(costs[index])
			4:
				text = str(Global.resources[resources[1]]) + "/" + str(costs[index]) + "   " + str(Global.resources[resources[2]]) + "/" + str(costs[index])
			5:
				text = str(Global.resources[resources[0]]) + "/" + str(costs[index]) + "   " + str(Global.resources[resources[1]]) + "/" + str(costs[index]) + "   " + str(Global.resources[resources[2]]) + "/" + str(costs[index])
		costLabels[index].text = text

func _on_tech_button_down(index):
	match index:
		0, 1, 2:
			if Global.resources[resources[index]] >= costs[index]:
				Global.resources[resources[index]] -= costs[index]
			else:
				return
		3:
			if Global.resources[resources[0]] >= costs[index] and Global.resources[resources[1]] >= costs[index]:
				Global.resources[resources[0]] -= costs[index]
				Global.resources[resources[1]] -= costs[index]
			else:
				return
		4:
			if Global.resources[resources[1]] >= costs[index] and Global.resources[resources[2]] >= costs[index]:
				Global.resources[resources[1]] -= costs[index]
				Global.resources[resources[2]] -= costs[index]
			else:
				return
		5:
			if Global.resources[resources[0]] >= costs[index] and Global.resources[resources[1]] >= costs[index] and Global.resources[resources[2]] >= costs[index]:
				Global.resources[resources[0]] -= costs[index]
				Global.resources[resources[1]] -= costs[index]
				Global.resources[resources[2]] -= costs[index]
			else:
				return
	var techBar = pgBars[index]
	techBar.value += techBar.step
	if techBar.value >= techBar.max_value:
			buttons[index].disabled = true
			# ADD PASSIVE INCOME
			Global.savedTech += 1
	
