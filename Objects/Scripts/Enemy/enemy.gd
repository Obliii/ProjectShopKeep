extends CharacterBody2D
class_name Enemy

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var move_component: MoveComponent = $MoveComponent
@onready var health_component: HealthComponent = $HealthComponent

@export var stats : EnemyStats

func _ready() -> void:
	
	#TODO - How to work in resource stats with components?????
	# CLEANLY???
	# THIS _READY MAY HAPPEN EARLIER OR LATER THAN THE COMPONENT _READY
	
	# DO WE NEED TO SET SOMETHING ELSE
	
	move_component.base_speed = stats.max_speed
	move_component.speed = stats.max_speed
	
	health_component.MAX_HEALTH = stats.max_health
	sprite_2d.texture = stats.texture
