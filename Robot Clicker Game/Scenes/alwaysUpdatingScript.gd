extends Timer

var globalVars
var pastAmount
var nowAmount
var thisRan = 0
var resultLabel
var wheatButton

@onready var timer: Timer = self
func _ready() -> void:
	wheatButton = $"../RightPanel/wheatButton"
	resultLabel = $"../RightPanel//wheatButton/wheatLabel"
	globalVars = $/root/GlobalSettings
	pastAmount = 0
	timer.start()
	timer.timeout.connect(_on_timeout)

func _on_timeout() -> void:
	print("timeout started")
	thisRan += 1
	if (globalVars.wheatStage < 3):
		globalVars.wheatStage += 1
	else:
		wheatButton.set_scale(Vector2(0.5,0.5))
		wheatButton.set_global_position(Vector2(970,438))
		resultLabel.set_text("Wheat ready!")
	globalVars.update_money(globalVars.idleEfficiency)
	if (thisRan > 2):
		nowAmount = globalVars.totalEarned
		globalVars.updateCPS((nowAmount - pastAmount)/3)
		pastAmount = nowAmount
		thisRan = 0
