extends Node2D
class_name LevelInstance

@export var level_data: LevelData
@onready var entity_container = $Entities
@onready var entity_spawners = $EnemySpawners
@onready var tilemaps = $TileMaps
@onready var player_spawn = $PlayerSpawner
@onready var enemy_object = preload("res://Objects/Scenes/enemy.tscn")
var enemy_spawn_point: Array
var enemies_remaining: int
var remaining_budget: int
signal enemy_spawned(value)

func _ready():
	init_level()
	Main.current_level = self

func init_level():
	# Randomize Seed and setup the map with all of its spawn points.
	randomize()
	init_timer()
	remaining_budget = level_data.default_spawn_budget * 1
	enemies_remaining = 0
	for entity in entity_container.get_children():
		enemies_remaining += 1
	for spawn_point in entity_spawners.get_children():
		if spawn_point is Node2D:
			enemy_spawn_point.append(spawn_point)
	if Main.audio_music:
		Main.audio_music.stream = level_data.level_music
		Main.audio_music.play()
	if Main.player_character:
		Main.player_character.global_position = player_spawn.global_position
	Main.game_playing = true
	hide_debug(true)

func spawn_random_enemy():
	var random_enemy = randi() % level_data.enemy_types.size()
	var random_spawn_point = randi() % enemy_spawn_point.size()
	var min_spawn_count = level_data.enemy_types[random_enemy].min_spawn_count
	var max_spawn_count = level_data.enemy_types[random_enemy].max_spawn_count
	var budget_cost = level_data.enemy_types[random_enemy].spawn_cost_per
	var spawn_time = level_data.enemy_types[random_enemy].time_between_spawns
	var amount_to_spawn = randi_range(min_spawn_count, max_spawn_count)
	var successful_spawn := false
	
	for n in amount_to_spawn:
		if remaining_budget >= budget_cost:
			remaining_budget -= budget_cost
			var new_enemy: Enemy = enemy_object.instantiate()
			new_enemy.stats = level_data.enemy_types[random_enemy].enemy_data
			new_enemy.global_position = enemy_spawn_point[random_spawn_point].global_position
			entity_container.add_child(new_enemy)
			enemies_remaining += 1
			enemy_spawned.emit(enemies_remaining)
			successful_spawn = true
			await get_tree().create_timer(1.5, false).timeout
	if successful_spawn and remaining_budget >= 1:
		start_new_spawn_timer(spawn_time)
		print("new budget: %s" %remaining_budget)
	else:
		return
	
# Clear all entities.
func clear_all_entities():
	for entity in entity_container.get_children():
		entity.queue_free()
	enemies_remaining = 0

func init_timer():
	get_tree().create_timer(5, false)
	start_new_spawn_timer()

func start_new_spawn_timer(value = 2):
	await get_tree().create_timer(value, false).timeout
	spawn_random_enemy()

func hide_debug(value: bool):
	if value:
		player_spawn.visible = false
