extends Control

var cost := 2
const INCREASE = 3
var beginButton :TextureButton
var pgBar :ProgressBar
var pgButton :TextureButton
var costLabel :Label

# Called when the node enters the scene tree for the first time.
func _ready():
	beginButton = $BeginTextureButton
	pgBar = $ProgressBar
	pgButton = $ProgressTextureButton
	costLabel = $BeginTextureButton/Label


func _physics_process(delta):
	costLabel.text = str(Global.resources.materials) + "/" + str(cost)


func _on_begin_texture_button_button_down():
	if Global.resources.materials >= cost:
		Global.resources.materials -= cost
		pgButton.disabled = false
		beginButton.disabled = true
		cost = pow(cost, INCREASE)


func _on_progress_texture_button_button_down():
	pgBar.value += pgBar.step
	if pgBar.value >= pgBar.max_value:
		pgBar.value = 0
		pgButton.disabled = true
		beginButton.disabled = false
