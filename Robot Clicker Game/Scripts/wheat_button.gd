extends TextureButton
var globalVars
var x = false
var labelObject
var shopObject

# Called when the node enters the scene tree for the first time.
func _ready():
	globalVars = $/root/GlobalSettings
	shopObject  = get_parent().get_node("Shop")
	print("Game script works")
	labelObject = $"wheatLabel"
	

# Called when the node enters the scene tree for the first time.
func _input(event) :
	
	if event is InputEventMouseButton: 
		if x == true :
			print(globalVars.wheatStage)
			print(shopObject.wheat_bought)
			if event.is_pressed() and globalVars.wheatStage >= 3 and shopObject.wheat_bought > 0:
				labelObject.set_text("Wheat growing...")
				globalVars.wheatStage = 0
				print("wheatClicked.")
				globalVars.update_money(shopObject.get_upgradeAmount("middle"))
				print(globalVars.money)
				set_scale(Vector2(0.43,0.43))
				set_global_position(Vector2(980,464))
		



func _on_mouse_entered() -> void:
	x = true



func _on_mouse_exited() -> void:
	x = false
