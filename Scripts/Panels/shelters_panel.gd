extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	_update_local()

func _update_local():
	$Label.text = tr("SHELTERS_TITLE")
	$NewShelters/SheltersLabel2.text = tr("SHELTERS_SHELTERS")
	$ExpandShelters/ExpansionsLabel2.text = tr("SHELTERS_EXPANSIONS")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
