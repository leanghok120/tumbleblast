extends CharacterBody2D

var movement_speed = 100
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	movement()

func movement():
	var pos_x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	var pos_y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	play_animations(pos_x, pos_y)
	var pos = Vector2(pos_x, pos_y)
	velocity = pos.normalized() * movement_speed
	move_and_slide()

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
