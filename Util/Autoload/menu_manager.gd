extends Node

@onready var title_screen: CanvasLayer = $TitleScreen
@onready var level_selection_screen: CanvasLayer = $LevelSelectionScreen
@onready var settings_screen: CanvasLayer = $SettingsScreen
@onready var gameplay_screen: Node2D = $GameScreen
@onready var pause_screen: CanvasLayer = null
@onready var overlay_screen: CanvasLayer = $OverlayScreen
var current_screen = title_screen

func _ready() -> void:
	switch_screen(title_screen)

# Switches the screen. Unpauses if the gameplay is back on.
func switch_screen(screen) -> void:
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
		

func hidable_screen() -> bool:
	if current_screen == pause_screen:
		return false
	if current_screen == gameplay_screen:
		return false
	
	return true
