extends CanvasLayer
class_name PauseScreen

@onready var game_instance: MenuManager = get_parent()

func _on_settings_button_pressed() -> void:
	game_instance.switch_screen(game_instance.settings_screen)

func _on_exit_level_button_pressed() -> void:
	game_instance.switch_screen(game_instance.title_screen)
	game_instance.goto_main_menu()
	Main.audio_music.stream = game_instance.main_menu_music
	Main.audio_music.play()
	
func _on_back_button_pressed() -> void:
	game_instance.switch_screen(game_instance.gameplay_screen)
	Main.game_paused = false
