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
# This is a workaround due to not being able to use the sprite.flip_h since it won't affect animations.
# It will flip the character ONE TIME, and won't do a flip loop if you try to move LEFT. ... yes. It does that.
var flip: bool = false:
	set(value):
		if(flip != value):
			entity.scale.x *= -1
			flip = value

func _ready():
	speed = base_speed

# Moves the player and flips the sprite.
func move(vector: Vector2, _delta):
	#If there's a sprite, then the sprite will flip depending on where its moving.
	# I'm not using sprite's flip_h because I want to also flip the animation.
	if vector.x > 0:
		flip = false
	elif vector.x < 0:
		flip = true
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
