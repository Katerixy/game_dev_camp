extends Node
var money
var totalEarned
var mouse_upgrades_bought = 0
var mouseEfficiency = 1
var idleEfficiency = 0
var labelObject
var wheatStage = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	totalEarned = 0
	money = 0
	labelObject = get_parent().get_node("Game")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func update_money(amount = mouseEfficiency):
	money += amount
	if amount > 0:
		totalEarned += amount
	labelObject.update_score_display()
	
func updateClickEfficiency(amount):
	mouseEfficiency += amount
	return mouseEfficiency
	
func updateIdleEfficiency(amount):
	idleEfficiency += amount
	return idleEfficiency
	
func updateCPS(amount):
	labelObject.update_cps(amount)
	
