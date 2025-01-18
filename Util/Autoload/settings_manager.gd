extends Node

# Viewport Settings
var viewport_size : Vector2i = Vector2i(1152, 648)
var screen_shake_toggled : bool = true
var background_motion : bool = false # Probably won't be having this honestly. Who knows.
var full_screen_toggled : bool = false

# Sound Settings
var master_volume : int = 50
var music_volume : int = 50
var sound_volume : int = 50

# Controls Settings.
# TODO: Bring up a secondary menu which will display the different controls that can be pressed.
# This will have its own apply button which will save into a JSON file for controls.

# TODO: This will end up being saved into a JSON file named which will contain all the settings.
func apply_settings():
	pass
