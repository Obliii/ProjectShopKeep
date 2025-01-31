extends Node
class_name MenuManager

var main_menu_music = load("res://Sound/Music/Title Screen.wav")
var readying_up_music = load("res://Sound/Music/Readying up!.wav")
var jimmy_the_knife_music = load("res://Sound/Music/jimmy the knife.wav")

@onready var title_screen: CanvasLayer = $TitleScreen
@onready var level_selection_screen: CanvasLayer = $LevelSelectionScreen
@onready var settings_screen: CanvasLayer = $SettingsScreen
@onready var gameplay_screen: Node2D = $GameScreen
@onready var pause_screen: CanvasLayer = $PauseScreen
@onready var overlay_screen: CanvasLayer = $OverlayScreen
@onready var hud_screen: CanvasLayer = $HudScreen
var current_screen = title_screen

func _ready() -> void:
	switch_screen(title_screen)
	PauseManager.menu_manager = self
	Main.audio_music = $Camera2D/MusicPlayer
	Main.audio_sound = $Camera2D/SoundPlayer
	hud_screen.setup_screen()

func goto_main_menu():
	Main.main_camera.global_position = Main.main_menu_position
	Main.game_playing = false
	Main.game_paused = false
	gameplay_screen.clear_current_map()

# Switches the screen. Unpauses if the gameplay is back on.
func switch_screen(screen, force = false) -> void:
	if current_screen and hidable_screen() or force:
		await overlay_screen.hide_screen(true)
		current_screen.visible = false
	
	if current_screen == pause_screen and screen != pause_screen:
		current_screen.visible = false
		pause_screen.visible = false
		
	current_screen = screen
	
	if current_screen and hidable_screen() or force:
		current_screen.visible = true
		await overlay_screen.hide_screen(false)
	elif current_screen == pause_screen:
		current_screen.visible = true
		
	if screen == pause_screen:
		get_tree().paused = true
	if screen == gameplay_screen:
		get_tree().paused = false

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
	if current_screen == settings_screen and Main.game_playing:
		return false
		
	return true
