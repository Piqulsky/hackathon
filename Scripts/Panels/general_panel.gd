extends Node2D

var sun :Sprite2D
var sky1 :Sprite2D
var sky2 :Sprite2D
var sky3 :Sprite2D
var sky4 :Sprite2D
var timer

var hospital :Sprite2D
var bank :Sprite2D
var factory :Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	sun = $Sun
	sky1 = $SkySprite1
	sky2 = $SkySprite2
	sky3 = $SkySprite3
	sky4 = $SkySprite4
	timer = $EndTimer
	factory = $Factory
	hospital = $Hospital
	bank = $Bank

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Global.factoryVisible:
		factory.visible = true
	if Global.bankVisibile:
		bank.visible = true
	if Global.hospitalVisible:
		hospital.visible = true
		
	if timer.time > 720:
		sky1.modulate.a = float(timer.time - 720.0)/180.0
	elif timer.time > 480:
		sky2.modulate.a = float(timer.time - 480.0)/240.0
	elif timer.time > 240:
		sky3.modulate.a = float(timer.time - 240.0)/240.0

func change_sun(time):
	sun.position = Vector2(sun.position.x, (900 - time )/3 + 96)
	var timeVal = float(time)/900
	sun.modulate = Color(sun.modulate.r, timeVal, timeVal)
