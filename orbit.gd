extends Camera3D

var angle = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var x = 9 * cos(angle)
	var z = 9 * sin(angle)
	
	angle += 0.1 * delta
	if angle > TAU:
		angle -= TAU
		
	position.x = x
	position.z = z
	look_at(Vector3(0, 0, 0))
	
