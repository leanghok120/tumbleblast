extends Node2D

@onready var enemy_scene = preload("res://scenes/enemy.tscn")
@onready var path_follow_2d: PathFollow2D = %PathFollow2D

func _on_timer_timeout() -> void:
	var enemy = enemy_scene.instantiate()
	path_follow_2d.progress_ratio = randf()
	enemy.global_position = path_follow_2d.global_position
	add_child(enemy)
