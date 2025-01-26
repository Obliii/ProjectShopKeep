extends Resource
class_name LevelData

@export var level_name: String
@export var level_music: AudioStreamWAV
@export var enemy_types: Array
# A lower number would be recommended since difficulty will only multiply this number from 1-3
@export var projected_enemies: int
