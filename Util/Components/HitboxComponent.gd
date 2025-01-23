extends Area2D
class_name HitboxComponent

@export var health_component : HealthComponent

# Detects if the hitbox has been touched by an attack component and deals damage accordingly.
func _on_body_entered(body) -> void:
	if !health_component:
		return
		
	var attack: AttackComponent
	for component in body.get_children():
		if component is AttackComponent:
			attack = component
	
	if attack:
		health_component.take_damage(attack.damage, attack.armor_piercing)
