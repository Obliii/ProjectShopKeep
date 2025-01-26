extends Resource
class_name WeaponData

# Weapon Texture
@export var texture: Texture2D

#Delay in between attacks in seconds
@export var attack_speed: float

# Bullet information - damage, ap
@export var bullet_data: BulletData

# Exclusively for the AI module to figure out the optimal range.
@export var ai_attack_range: int

@export var bullet_offset: Vector2


# Any "bonuses" or adjustments to the bullet should be here
