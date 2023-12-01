extends TextureButton

var value := 0
var valueLabel :Label;

# Called when the node enters the scene tree for the first time.
func _ready():
	valueLabel = $GoldValue
	valueLabel.text = "0/100"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_down():
	if(value<=100):
		value += 1
		valueLabel.text = str(value) + "/100"
