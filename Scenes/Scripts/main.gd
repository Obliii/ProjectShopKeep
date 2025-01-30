extends Node

@onready var main_menu_position = Vector2i(576,324)
enum Difficulty { DIFFICULTY_NONE, DIFFICULTY_EASY, DIFFICULTY_NORMAL, DIFFICULTY_HARD }

# Global References
var player_character: PhysicsBody2D
var audio_music: AudioStreamPlayer2D
var audio_sound: AudioStreamPlayer2D
var main_camera: Camera2D

# Game Instance
var game_playing: bool
var game_paused: bool
var selected_difficulty: Difficulty
