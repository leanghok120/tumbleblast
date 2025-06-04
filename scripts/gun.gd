extends Area2D

@onready var muzzle: Marker2D = %muzzle
@export var bullet_scene: PackedScene

func _physics_process(delta: float) -> void:
	var enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() > 0:
		var target = enemies_in_range[0]
		look_at(target.global_position)


func _on_timer_timeout() -> void:
	var bullet = bullet_scene.instantiate()
	bullet.global_position = muzzle.global_position
	bullet.rotation = rotation
	get_tree().current_scene.add_child(bullet)
