extends CharacterBody2D
class_name Enemy

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var move_component: MoveComponent = $MoveComponent
@onready var health_component: HealthComponent = $HealthComponent

@export var stats : EnemyStats

func _ready() -> void:
	move_component.base_speed = stats.max_speed
	move_component.reset_speed()
	
	health_component.MAX_HEALTH = stats.max_health
	health_component.reset_health()
	
	sprite_2d.texture = stats.texture
