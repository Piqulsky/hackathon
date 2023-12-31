extends Control

var cost := 2
var beginButton :TextureButton
var pgBar :TextureProgressBar
var pgButton :TextureButton
var costLabel :Label
var sheltersLabel :Label
@export var icon :Texture2D

# Called when the node enters the scene tree for the first time.
func _ready():
	beginButton = $BeginTextureButton
	pgBar = $ProgressBar
	pgButton = $ProgressTextureButton
	costLabel = $BeginTextureButton/Label
	sheltersLabel = $SheltersLabel


func _physics_process(delta):
	costLabel.text = str(Global.resources.materials) + "/" + str(cost)
	
	if Global.automaticShelterBuilder and pgButton.disabled == false:
		pgBar.value += pgBar.step
		if pgBar.value >= pgBar.max_value:
			pgBar.value = 0
			pgButton.disabled = true
			beginButton.disabled = false
			Global.shelters += 1
			sheltersLabel.text = str(Global.shelters)


func _on_begin_texture_button_button_down():
	if Global.resources.materials >= cost:
		Global.resources.materials -= cost
		pgButton.disabled = false
		beginButton.disabled = true
		if cost != 15000:
			cost *= Global.SHELTER_INCREASE
		if cost > 15000:
			cost = 15000


func _on_progress_texture_button_button_down():
	pgBar.value += pgBar.step * 40
	if pgBar.value >= pgBar.max_value:
		pgBar.value = 0
		pgButton.disabled = true
		beginButton.disabled = false
		Global.shelters += 1
		sheltersLabel.text = str(Global.shelters)
