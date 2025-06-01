extends Area2D

@export var damage = 1
@onready var collision_shape: CollisionShape2D = $CollisionShape2D
@onready var disabled_timer: Timer = $DisabledTimer

func tempdisable():
	collision_shape.call_deferred("set", "disabled", true)
	disabled_timer.start()


func _on_disabled_timer_timeout() -> void:
	collision_shape.call_deferred("set", "disabled", false)
