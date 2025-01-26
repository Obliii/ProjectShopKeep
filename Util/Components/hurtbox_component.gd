extends Area2D
class_name HurtboxComponent

signal hitbox_struck

@export var damage_component: DamageComponent

func _on_area_entered(area: Area2D) -> void:
	print("HITBOX HIT")
	if owner.is_queued_for_deletion():
		return
	
	if area is HitboxComponent:
		if damage_component:
			var attack: = damage_component.get_attack()
			
			area.damage(attack)
		
		
		# In case we want to hit something else, we may have a heal_component
		# or something
		
	#end if area is Hitbox
	hitbox_struck.emit()


func _on_body_entered(body: Node2D) -> void:
	if body is TileMapLayer:
		hitbox_struck.emit()
