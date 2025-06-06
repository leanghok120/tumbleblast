extends CharacterBody2D

var movement_speed = 100
var max_hp = 10
var hp = max_hp
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

signal hp_changed()

func _physics_process(delta: float) -> void:
	movement()

# handle movement
func movement():
	var pos_x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	var pos_y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	play_animations(pos_x, pos_y)
	var pos = Vector2(pos_x, pos_y)
	velocity = pos.normalized() * movement_speed
	move_and_slide()

# runs when player gets hurt
func _on_hurtbox_hurt(damage: Variant) -> void:
	hp -= damage
	emit_signal("hp_changed")
	if hp <= 0:
		hp = max_hp

# play the player's animations
func play_animations(pos_x, pos_y):
	if pos_x == 0 and pos_y == 0:
		animated_sprite.play("idle")
	elif pos_x > 0 and pos_y > 0:
		animated_sprite.flip_h = false
		animated_sprite.play("walk_down_right")
	elif pos_x > 0 and pos_y < 0:
		animated_sprite.flip_h = false
		animated_sprite.play("walk_up_right")
	elif pos_x < 0 and pos_y > 0:
		animated_sprite.flip_h = true
		animated_sprite.play("walk_down_right")
	elif pos_x < 0 and pos_y < 0:
		animated_sprite.flip_h = true
		animated_sprite.play("walk_up_right")
	elif pos_y > 0:
		animated_sprite.play("walk_down")
	elif pos_y < 0:
		animated_sprite.play("walk_up")
	elif pos_x > 0:
		animated_sprite.flip_h = false
		animated_sprite.play("walk_right")
	elif pos_x < 0:
		animated_sprite.flip_h = true
		animated_sprite.play("walk_right")
