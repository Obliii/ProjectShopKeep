extends CanvasLayer

@onready var game_instance = get_parent()

func _on_play_button_pressed() -> void:
	pass

func _on_settings_button_pressed() -> void:
	game_instance.switch_screen(game_instance.settings_screen)

func _on_exit_button_pressed() -> void:
	get_tree().quit()
