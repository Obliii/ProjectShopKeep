extends Node

var menu_manager: MenuManager

func _ready() -> void:
	process_mode = PROCESS_MODE_ALWAYS

func _physics_process(_delta: float) -> void:
	if is_paused() and Input.is_action_just_pressed("move_pause"):
		get_tree().paused = false
		Main.game_paused = false
		menu_manager.switch_screen(menu_manager.gameplay_screen)
		menu_manager.pause_screen.visible = false
	elif !is_paused() and Input.is_action_just_pressed("move_pause") and Main.game_playing:
		get_tree().paused = true
		Main.game_paused = true
		menu_manager.switch_screen(menu_manager.pause_screen)

func is_paused() -> bool:
	if Main.game_playing and Main.game_paused:
		return true
	return false
