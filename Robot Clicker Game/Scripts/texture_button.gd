extends TextureButton


# Called when the node enters the scene tree for the first time.
@export var min_boundary : Vector2 = Vector2(0, 100)
@export var max_boundary : Vector2 = Vector2(700, 500)
func _ready() -> void:
	pass # Replace with function body.
	pressed.connect(_on_pressed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_pressed() -> void:
	var random_x: float = randf_range(min_boundary.x, max_boundary.x)
	var random_y: float = randf_range(min_boundary.y, max_boundary.y)
	set_global_position(Vector2(random_x,random_y))
