extends Node
class_name WeaponComponent

@export var primary_weapon: WeaponData
@export var secondary_weapon: WeaponData
@export var weapon_sprite: Sprite2D
var showing_weapon: bool = false

func fire_primary_weapon(direction: Vector2):
	pass

func fire_secondary_weapon(direction: Vector2):
	pass

func show_weapon(value):
	showing_weapon = value
	weapon_sprite.visible = value

func rotate_weapon(direction: Vector2):
	weapon_sprite.look_at(direction)
