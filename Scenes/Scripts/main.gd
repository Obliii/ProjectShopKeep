extends Node

enum Difficulty { DIFFICULTY_NONE, DIFFICULTY_EASY, DIFFICULTY_NORMAL, DIFFICULTY_HARD }

# Global References
var player_character: PhysicsBody2D
var audio_music: AudioStreamPlayer2D
var audio_sound: AudioStreamPlayer2D

# Game Instance
var game_playing: bool
var game_paused: bool
var selected_difficulty: Difficulty
