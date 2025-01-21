extends Node
class_name MoveComponent

@export var entity: CharacterBody2D
@export var base_speed: int = 100

# Dashing params
@export var max_dash_time: float = 0.2
@export var dash_cooldown: float = 0.5
@export var dash_multiplier: int = 2

var speed: int
var can_dash: bool = true

func _ready():
	speed = base_speed

func move(vector: Vector2, _delta):
	entity.move_and_collide(vector * speed * _delta)

func dash():
	if can_dash:
		start_dashing()

func start_dashing():
	can_dash = false
	speed = base_speed * dash_multiplier
	await get_tree().create_timer(max_dash_time, false).timeout
	speed = base_speed
	start_dash_cooldown()

func start_dash_cooldown():
	can_dash = false
	await get_tree().create_timer(dash_cooldown, false).timeout
	can_dash = true
