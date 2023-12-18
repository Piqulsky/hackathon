extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	_update_local()

func _update_local():
	$ResourcesLabel.text = tr("RESOURCES_TITLE")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
