extends TextureButton

var valueLabel :Label

func _ready():
	valueLabel = $MaterialsValue
	valueLabel.text = "0"

func _physics_process(delta):
	valueLabel.text = str(Global.resources.materials)


func _on_button_down():
	Global.resources.materials += Global.resourcesMultiplier.materials


func _on_timer_timeout():
	Global.resources.materials += Global.passiveMaterialsIncome
