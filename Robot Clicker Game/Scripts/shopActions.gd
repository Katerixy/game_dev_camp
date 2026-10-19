extends Node
##shop variables
var itemInfo = {"simple" : [1, 0, 1], "middle" : [10, 0, 5], "costly" : [30, 0, 1], "win": [10, 0, 0]}
#^name : [base cost, amount owned, amount of upgrade to cps]
var resultLabel
var globalVars
var wheatObject
var mouse_upgrades_bought
var mouse_sprites

#mouse sprite variables

#upgrade variabels
var wheat_bought = 0
var wheat_cps = 0
var troops_bought = 0

var simpleLabel 
var middleLabel 
var costlyLabel

func _ready():
	mouse_upgrades_bought = 0
	mouse_sprites = [load("res://assets/sprites/base_cursor.png"),load("res://assets/sprites/Knife.PNG"),load("res://assets/cursor_sword.png"),load("res://assets/curse_gun.png"),load("res://assets/lightsaber-removebg-preview.png")]
	simpleLabel = get_node("GridContainer/SimpleUpgrade")
	middleLabel = get_node("GridContainer/MiddleUpgrade")
	costlyLabel = get_node("GridContainer/CostlyUpgrade")
	Input.set_custom_mouse_cursor(mouse_sprites[0])
	costlyLabel.set_text("Buy troop: " + str(get_cost("costly")))
	middleLabel.set_text("Buy harvest: " + str(get_cost("middle")))
	simpleLabel.set_text("Buy weapon: " + str(get_cost("simple")))
	resultLabel = get_node("Result")
	globalVars = $/root/GlobalSettings
	wheatObject = get_parent().get_node("wheatButton")
	print("Shop turned on")
	wheatObject.visible = false
	

func get_cost(itemType): #returns cost based on amount of items bought and base cost
	var totalCost
	var n = itemInfo[itemType][1]
	if itemType == "simple":
		totalCost = 20 * (n+1) - 15
	elif itemType == "middle":
		totalCost = (int)(n*n - n/10 + 10)
	elif itemType == "costly":
		totalCost = n*n+20
	else:
		totalCost = 1000000
	return totalCost

func get_upgradeAmount(itemType):
	var upgrade
	var n = itemInfo[itemType][1]
	if itemType == "simple":
		upgrade = n*2
	elif itemType == "middle":
		upgrade = n*n
	elif itemType == "costly":
		upgrade = n*5
	else:
		upgrade = 0
	return upgrade
func checkBuyRequirements(cost):
	if globalVars.money >= cost:
		return true
	false

func tryToBuy(itemType):
	var totalCost = get_cost(itemType)
	if checkBuyRequirements(totalCost):
		resultLabel.set_text("Buy Success")
		itemInfo[itemType][1] += 1
		itemInfo[itemType][2] = (int)(itemInfo[itemType][2] * 1.5)
		globalVars.update_money(-1 * totalCost)
		return true
	else:
		resultLabel.set_text("Cannot buy")
		return false
	print(str(itemInfo[itemType][0]) + " " + str(itemInfo[itemType][1]))
	
	
func _on_simple_upgrade_pressed():
	if tryToBuy("simple"):
		mouse_upgrades_bought += 1
		if mouse_upgrades_bought > 0 and mouse_upgrades_bought < mouse_sprites.size():
			print("changing mouse")
			Input.set_custom_mouse_cursor(mouse_sprites[mouse_upgrades_bought])
		simpleLabel.set_text("Buy weapon: " + str(get_cost("simple")))
		print("mouse upgrade number:" + str(mouse_upgrades_bought + 1))
		globalVars.updateClickEfficiency(get_upgradeAmount("simple"))


func _on_middle_upgrade_pressed():
	if tryToBuy("middle"):
		middleLabel.set_text("Buy harvest: " + str(get_cost("middle")))
		if (wheat_bought == 0):
			wheatObject.visible = true

		else:
			pass
		wheat_bought += 1


func _on_costly_upgrade_pressed():
	if tryToBuy("costly"):
		costlyLabel.set_text("Buy troop: " + str(get_cost("costly")))
		globalVars.updateIdleEfficiency(get_upgradeAmount("costly"))
		

func _on_win_button_pressed() -> void:
	if tryToBuy("win"):
		pass
