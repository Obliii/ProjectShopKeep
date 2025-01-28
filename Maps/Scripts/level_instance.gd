extends Node2D
class_name LevelInstance

@export var level_data: LevelData
@onready var entity_container = $Entities
var enemy_spawn_point: Array
var enemies_remaining: int
var projected_enemies: int

func init_level():
	enemies_remaining = level_data.projected_enemies * Main.selected_difficulty
	projected_enemies = 0
	Main.audio_music.stream = level_data.level_music

func spawn_enemy():
	pass

# Clear all entities.
func clear_all_entities(include_player = false):
	for entity in entity_container.get_children():
		if entity is Player and !include_player:
			pass
		entity.queue_free()
	enemies_remaining = 0
