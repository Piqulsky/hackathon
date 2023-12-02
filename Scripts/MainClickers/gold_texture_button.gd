extends TextureButton

var valueLabel :Label

func _ready():
	valueLabel = $GoldValue
	valueLabel.text = "0"

func _physics_process(delta):
	valueLabel.text = str(Global.resources.gold)


func _on_button_down():
	Global.resources.gold += Global.resourcesMultiplier.gold


func _on_timer_timeout():
	Global.resources.gold += Global.passiveGoldIncome
