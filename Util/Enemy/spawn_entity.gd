extends Resource
class_name SpawnEntity

@export var enemy_data: EnemyStats
@export var max_spawn: int # How many is allowed on the map at maximum.
@export var time_between_spawns: int # How long of a delay before more can spawn.
@export var min_spawn_count: int # Whats the minimum that can spawn at the same time.
@export var max_spawn_count: int # Whats the maximum that can spawn at the same time.
@export var spawn_cost_per: int # How much this spawn costs in the spawn budget.
