extends Node
class_name HealthComponent

# Where are we getting hit from?
# If we need multiple hitboxes, turn this into an array
@export var hitbox_component: HitboxComponent

@export var MAX_HEALTH: int
@export var BASE_ARMOR: int

var health: int
var armor: int

signal health_changed
signal killed

func _ready():
	# Connect us up the hitbox
	# Make this into a for loop if changed into an array
	if hitbox_component:
		hitbox_component.damaged.connect(_attacked)
	reset_health()
	armor = BASE_ARMOR
	
func reset_health() -> void:
	health = MAX_HEALTH

func _attacked(attack: Attack) -> void:
	take_damage(attack.damage, attack.armor_piercing)

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
	health -= damage_value
	health_changed.emit()

# Deals flat damage that is unaffected by armor.
func take_flat_damage(value):
	health -= value
	health_changed.emit()

# Heals the entity.
func heal(value):
	health += value
	if health > MAX_HEALTH:
		health = MAX_HEALTH
	health_changed.emit()

# A signal fired when the entity's health changes.
func _on_health_changed():
	if health <= 0:
		killed.emit()
