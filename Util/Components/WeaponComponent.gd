extends Node
class_name WeaponComponent

const BULLET_SCENE: PackedScene = preload("uid://b5pdn6smfx07d")

@export var weapon_data: WeaponData
@export var weapon_sprite: Sprite2D

var showing_weapon: bool = false
var ready_to_fire: bool = true

var entity: PhysicsBody2D

func _ready() -> void:
	if owner is PhysicsBody2D:
		entity = owner
	

func fire_primary_weapon(direction: Vector2):
	if not ready_to_fire:
		return

	var new_bullet: Bullet = BULLET_SCENE.instantiate()
	new_bullet.bullet_data = weapon_data.bullet_data
	new_bullet.global_position = entity.position + (direction)
	new_bullet.direction = direction
	get_tree().get_root().add_child(new_bullet)
	
	ready_to_fire = false
	var cooldown_timer: SceneTreeTimer = get_tree().create_timer(weapon_data.attack_speed)
	cooldown_timer.timeout.connect(_ready_weapon)
	
func _ready_weapon():
	ready_to_fire = true
	

func fire_secondary_weapon(_direction: Vector2):
	pass

func show_weapon(value):
	showing_weapon = value
	weapon_sprite.visible = value

# TODO: ROTATE CHARACTER TOWARDS PLAYER TO FOLLOW THE MOUSE. No upside down gun.
func rotate_weapon(direction: Vector2):
	weapon_sprite.look_at(direction)
	
