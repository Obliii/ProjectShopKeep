extends Resource
class_name EnemyStats

@export var texture: Texture2D

@export var max_health := 10.0

# Maximum speed
@export var max_speed := 70.0
# Amount max speed can vary between the same enemy
@export var variation_range := 10.0
# Amount of time needed to reach full speed
@export var acceleration_time := 2.5
@export var friction := 1.0

# Possibly? Loot Table drops?

# Starting Weapon
