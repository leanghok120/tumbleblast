extends Area2D

@export_enum("Cooldown", "HitOnce", "DisableHitbox") var HurtboxType = 0

@onready var collision_shape: CollisionShape2D = $CollisionShape2D
@onready var disabled_timer: Timer = $DisabledTimer

signal hurt(damage)

func _on_area_entered(area: Area2D) -> void:
	if not area.is_in_group("attack"):
		return
	if area.get("damage") == null:
		return
	
	match HurtboxType:
		0: # cooldown
			collision_shape.call_deferred("set", "disabled", true)
			disabled_timer.start()
		1: # hit once
			pass
		2: # disable hitbox
			if area.has_method("tempdisable"):
				area.tempdisable()
	emit_signal("hurt", area.damage)


func _on_disabled_timer_timeout() -> void:
	collision_shape.call_deferred_thread_group("set", "disabled", false)
