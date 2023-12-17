extends Control

var grainButton :TextureButton
var meatButton :TextureButton
var plantsButton :TextureButton
var grainLabel :Label
var meatLabel :Label
var plantsLabel :Label
var grainCost := 2
var meatCost := 2
var plantsCost := 2


# Called when the node enters the scene tree for the first time.
func _ready():
	grainButton = $GrainTextureButton
	meatButton = $MeatTextureButton
	plantsButton = $PlantsTextureButton
	grainLabel = $GrainTextureButton/Cost
	meatLabel = $MeatTextureButton/Cost
	plantsLabel = $PlantsTextureButton/Cost


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	grainLabel.text = str(Global.resources.gold) + "/" + str(grainCost)
	meatLabel.text = str(Global.resources.gold) + "/" + str(meatCost)
	plantsLabel.text = str(Global.resources.gold) + "/" + str(plantsCost)


func _on_grain_texture_button_button_down():
	if Global.resources.gold >= grainCost:
		Global.resources.gold -= grainCost
		if grainCost != 333:
			grainCost *= Global.GRAIN_INCREASE
		if grainCost > 333:
			grainCost = 333
		Global.food += Global.GRAIN_VALUE


func _on_meat_texture_button_button_down():
	if Global.resources.gold >= meatCost:
		Global.resources.gold -= meatCost
		if meatCost != 666:
			meatCost *= Global.MEAT_INCREASE
		if meatCost > 666:
			meatCost = 666
		Global.food += Global.MEAT_VALUE


func _on_plants_texture_button_button_down():
	if Global.resources.gold >= plantsCost:
		Global.resources.gold -= plantsCost
		if plantsCost != 1000:
			plantsCost *= Global.PLANTS_INCREASE
		if plantsCost > 1000:
			plantsCost = 1000
		Global.food += Global.PLANTS_VALUE
