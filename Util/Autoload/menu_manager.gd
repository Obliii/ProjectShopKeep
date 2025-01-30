extends Node
class_name MenuManager

@onready var title_screen: CanvasLayer = $TitleScreen
@onready var level_selection_screen: CanvasLayer = $LevelSelectionScreen
@onready var settings_screen: CanvasLayer = $SettingsScreen
@onready var gameplay_screen: Node2D = $GameScreen
@onready var pause_screen: CanvasLayer = null
@onready var overlay_screen: CanvasLayer = $OverlayScreen
var current_screen = title_screen

func _ready() -> void:
	switch_screen(title_screen)
	Main.audio_music = $Camera2D/MusicPlayer
	Main.audio_sound = $Camera2D/SoundPlayer

func goto_main_menu():
	Main.main_camera.global_position = Main.main_menu_position
	Main.game_playing = false
	Main.game_paused = false

# Switches the screen. Unpauses if the gameplay is back on.
func switch_screen(screen, force = false) -> void:
	if screen == pause_screen:
		get_tree().paused = true
	if screen == gameplay_screen:
		get_tree().paused = false
	
	if hidable_screen():
		await overlay_screen.hide_screen(true)
		current_screen.visible = false
	
	current_screen = screen
	
	if hidable_screen():
		current_screen.visible = true
		await overlay_screen.hide_screen(false)
	
	if force:
		await overlay_screen.hide_screen(false)

func close_all_ui():
	title_screen.visible = false
	level_selection_screen.visible = false
	settings_screen.visible = false
	#pause_screen.visible = false

func hidable_screen() -> bool:
	if current_screen == pause_screen:
		return false
	if current_screen == gameplay_screen:
		return false
	
	return true
