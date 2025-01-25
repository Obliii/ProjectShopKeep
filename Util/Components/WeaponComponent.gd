extends Node
class_name WeaponComponent

const BULLET_SCENE: PackedScene = preload("uid://b5pdn6smfx07d")

@export var weapon_data: WeaponData
@export var weapon_sprite: Sprite2D

var showing_weapon: bool = false

func fire_primary_weapon(direction: Vector2):
	var new_bullet: Bullet = BULLET_SCENE.instantiate()
	new_bullet.bullet_data = weapon_data.bullet_data
	pass

func fire_secondary_weapon(direction: Vector2):
	pass

func show_weapon(value):
	showing_weapon = value
	weapon_sprite.visible = value

# TODO: ROTATE CHARACTER TOWARDS PLAYER TO FOLLOW THE MOUSE. No upside down gun.
func rotate_weapon(direction: Vector2):
	weapon_sprite.look_at(direction)
