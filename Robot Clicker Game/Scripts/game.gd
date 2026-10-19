extends Control

var counterLabel
var globalVars
var x = false
var missed
var speed
var y = false

var oneTime = -1
var a = 0
var b = 0
var i = false
var time = 0
var perSecond
var k = false

var instructions

# Called when the node enters the scene tree for the first time.
func _ready():
	globalVars = $/root/GlobalSettings
	instructions = get_node("InfoButton/InfoLabel")
	print("Game script works")
	counterLabel = get_node("CookiePanel/MarginContainer/VBoxContainer/Counter")
	perSecond = get_node("CookiePanel/MarginContainer/VBoxContainer/Per Second")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta) :
	time += delta


func _input(event) :
	
	if event is InputEventMouseButton: 
		if x == true :
			if event.is_pressed():
				print("It is a mouse click.")
				globalVars.update_money()
				print(str(globalVars.money) + " clicks")
		
		if y == true:
			if k == false && event.is_pressed():
				instructions.visible = true
				k = true
				print("pressed on info")
			elif k == true && event.is_pressed():
				instructions.visible = false
				k = false


func _on_texture_button_mouse_entered() -> void:
	x = true
	
func _on_texture_button_mouse_exited() -> void:
	x = false


func update_score_display() : #DO NOT DIRECTLY USE THIS!! USE globalVars.updateMoney()
	counterLabel.set_text(str(globalVars.money) + " SCRAP")
	
func update_cps(amount): #DO NOT DIRECTLY USE
	perSecond.set_text(str(amount) + " scrap earned per second")
	


func _on_button_mouse_entered() -> void:
	y = true
	

func _on_button_mouse_exited() -> void:
	y = false
