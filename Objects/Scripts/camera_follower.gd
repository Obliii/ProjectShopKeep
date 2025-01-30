extends Camera2D

@onready var player_character = $"../Player"
func _ready() -> void:
	Main.main_camera = self

func _physics_process(delta: float) -> void:
	if player_character and Main.game_playing:
		global_position = player_character.global_position
	
