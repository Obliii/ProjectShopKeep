extends Node
class_name HealthComponent

@export var MAX_HEALTH: int
@export var BASE_ARMOR: int
var health: int
var armor: int
signal health_changed

func _ready():
	health = MAX_HEALTH
	armor = BASE_ARMOR

# Deals damage to the entity.
func take_damage(value, ap_value):
	var damage_value = value
	var armor_value = armor
	
	# Calculate the damage against the armor, and don't let it reach below 1.
	armor_value -= ap_value
	damage_value -= armor_value
	if damage_value < 1:
		damage_value = 1
	
	# Deal damage to the character.
	health - damage_value
	emit_signal("health_changed")

# Deals flat damage that is unaffected by armor.
func take_flat_damage(value):
	health -= value
	emit_signal("health_changed")

# Heals the entity.
func heal(value):
	health += value
	if health > MAX_HEALTH:
		health = MAX_HEALTH
	emit_signal("health_changed")

# A signal fired when the entity's health changes.
func _on_health_changed():
	if health <= 0:
		emit_signal("character_killed")
