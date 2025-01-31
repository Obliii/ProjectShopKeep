extends CharacterBody2D
class_name Player

@onready var health_component: HealthComponent = $HealthComponent

func _ready() -> void:
	Main.player_character = self
