extends TextureButton

var valueLabel :Label

func _ready():
	valueLabel = $ScienceValue
	valueLabel.text = "0"

func _physics_process(delta):
	valueLabel.text = str(Global.resources.science)


func _on_button_down():
	Global.resources.science += Global.resourcesMultiplier.science


func _on_timer_timeout():
	Global.resources.science += Global.passiveScienceIncome
