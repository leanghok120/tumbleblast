extends Area2D

var speed = 600.0
var travelled_distance = 0
var range = 1000

# moves forward in the direction of the gun
func _physics_process(delta: float) -> void:
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * speed * delta
	
	travelled_distance += speed * delta
	if travelled_distance > range:
		queue_free()
