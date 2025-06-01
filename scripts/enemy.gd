extends CharacterBody2D

@export var movement_speed = 40
@export var hp = 10
@onready var player = get_tree().get_first_node_in_group("player")
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * movement_speed
	play_animations(velocity.x, velocity.y)
	move_and_slide()

func play_animations(pos_x, pos_y):
	if pos_x == 0 and pos_y == 0:
		animated_sprite.play("idle")
	else:
		animated_sprite.play("walk")


func _on_hurtbox_hurt(damage: Variant) -> void:
	hp -= damage
	if hp < 0:
		queue_free()
