extends CharacterBody2D
class_name Enemy

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var move_component: MoveComponent = $MoveComponent
@onready var health_component: HealthComponent = $HealthComponent
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var weapon_component: WeaponComponent = $WeaponComponent

@export var stats : EnemyStats

func _ready() -> void:
	move_component.base_speed = stats.max_speed
	move_component.reset_speed()
	
	health_component.MAX_HEALTH = stats.max_health
	health_component.reset_health()
	
	sprite_2d.texture = stats.texture
	
	weapon_component.weapon_data = stats.weapon_data

func _on_health_changed(_new_health: int) -> void:
	# Some sort of damage effect
	if animation_player:
		animation_player.play("damaged")

func _on_health_component_killed() -> void:
	#maybe make some death effects
	queue_free()
