extends Area2D
class_name HurtboxComponent

signal hitbox_struck

@export var damage_component: DamageComponent

var group_blacklist: Array[StringName]

func _on_area_entered(area: Area2D) -> void:
	if owner.is_queued_for_deletion():
		return
	
	# walls are handled in the next function
	
	if area is HitboxComponent:
		# We need to check only if we're looking at a hitbox
		var area_groups: Array[StringName] = area.owner.get_groups()
		for group in group_blacklist:
			if group in area_groups:
				return
		if damage_component:
			var attack: = damage_component.get_attack()
			
			area.damage(attack)
		
		
		# In case we want to hit something else, we may have a heal_component
		# or something
		hitbox_struck.emit()
	#end if area is Hitbox
		


func _on_body_entered(body: Node2D) -> void:
	if body is TileMapLayer:
		hitbox_struck.emit()
