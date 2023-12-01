extends Control

var cost := 16
const INCREASE := 2
var multiplierLabel :Label
var villagerCost :Label
var genBar :ProgressBar
var villagers := 0

# Called when the node enters the scene tree for the first time.
func _ready():
	multiplierLabel = $MultiplierLabel
	villagerCost = $BuyTextureButton/Cost
	genBar = $GenerationBar


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	villagerCost.text = str(Global.resources.gold) + "/" + str(cost)
	if villagers > 0:
		genBar.value += genBar.step
		if genBar.value >= 100:
			genBar.value = 0
			#ADD RESOURCES * VILLAGERS


func _on_buy_texture_button_button_down():
	if Global.resources.gold >= cost:
		Global.resources.gold -= cost
		cost = pow(cost, INCREASE)
		
		villagers += 1
		multiplierLabel.text = str(villagers) + "x"
