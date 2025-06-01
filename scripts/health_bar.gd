extends ProgressBar

@onready var player: CharacterBody2D = %Player

func _ready() -> void:
	update()

func update():
	value = player.hp


func _on_player_hp_changed() -> void:
	update()
