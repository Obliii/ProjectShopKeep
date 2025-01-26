extends CanvasLayer

@onready var game_instance: MenuManager = get_parent()

func _on_kobold_cafe_button_pressed() -> void:
	game_instance.switch_screen(game_instance.gameplay_screen)

func _on_back_button_pressed() -> void:
	game_instance.switch_screen(game_instance.title_screen)
