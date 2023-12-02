extends Control

var timerLabel :Label
var time = 900

# Called when the node enters the scene tree for the first time.
func _ready():
	timerLabel = $TimeLabel


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	get_parent().change_sun(time)
	time -= 1
	var minutes = int(time/60)
	var seconds = time - minutes * 60
	timerLabel.text = str(minutes).lpad(2, "0") + ":" + str(seconds).lpad(2, "0")
	if time == 898:
		visible = true
	if time == 0:
		$EndTimer.stop()
