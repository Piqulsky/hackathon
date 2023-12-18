extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func fill_with_data(name, people, heritage):
	$NameLabel.text = name
	$PeopleLabel.text = str(people) + "mln"
	$HeritageLabel.text = str(heritage) + "%"
