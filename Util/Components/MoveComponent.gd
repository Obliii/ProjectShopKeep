extends Node
class_name MoveComponent

@export var entity: PhysicsBody2D
@export var base_speed: int = 100

# Dashing params
@export var max_dash_time: float = 0.2
@export var dash_cooldown: float = 0.5
@export var dash_multiplier: int = 2

var speed: int
var can_dash: bool = true

func _ready():
	reset_speed()
	
func reset_speed() -> void:
	speed = base_speed


# Moves the player and flips the sprite.
func move(vector: Vector2, _delta):
	entity.move_and_collide(vector * speed * _delta)

# Fires the start_dashing function if the entity can dash.
func dash():
	if can_dash:
		start_dashing()

# Starts the dash for a few seconds, increasing the speed then starts the cooldown
func start_dashing():
	can_dash = false
	speed = base_speed * dash_multiplier
	await get_tree().create_timer(max_dash_time, false).timeout
	speed = base_speed
	start_dash_cooldown()

# Dash completed. This will start the cooldown.
func start_dash_cooldown():
	can_dash = false
	await get_tree().create_timer(dash_cooldown, false).timeout
	can_dash = true
