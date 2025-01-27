extends Node
class_name DamageComponent

# Damage??? More likely than you think

var damage: int
var armor_piercing: int

func get_attack() -> Attack:
	var attack: = Attack.new()
	attack.damage = damage
	attack.armor_piercing = armor_piercing
	return attack
