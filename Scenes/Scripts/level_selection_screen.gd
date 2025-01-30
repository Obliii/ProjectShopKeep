extends CanvasLayer

@onready var game_instance: MenuManager = get_parent()
@onready var kobold_motel_map = load("res://Maps/LevelTemplate.tscn")


func _on_kobold_cafe_button_pressed() -> void:
	var map = kobold_motel_map.instantiate()
	game_instance.gameplay_screen.add_child(map)
	await game_instance.switch_screen(game_instance.gameplay_screen, true)
	game_instance.close_all_ui()

func _on_back_button_pressed() -> void:
	game_instance.switch_screen(game_instance.title_screen)
