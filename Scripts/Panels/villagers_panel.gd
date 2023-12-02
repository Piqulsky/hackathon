extends Control

var cost := 16
var multiplierLabel :Label
var villagerCost :Label
var genBar
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
		genBar.value += genBar.step * Global.villagerWorkMultiplier
		if genBar.value >= 100:
			genBar.value = 0
			Global.food += villagers


func _on_buy_texture_button_button_down():
	if Global.resources.gold >= cost:
		Global.resources.gold -= cost
		cost *= Global.VILLAGERS_INCREASE
		
		villagers += 1
		multiplierLabel.text = str(villagers) + "x"
