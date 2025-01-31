extends CanvasLayer

@export var overlay_screen: OverlayScreen
@onready var main_slider = $Control/ColorRect/VBoxContainer/MainVolume/MainVolumeSlider
@onready var music_slider = $Control/ColorRect/VBoxContainer/MusicVolume/MusicSlider
@onready var sound_slider = $Control/ColorRect/VBoxContainer/SoundVolume/SoundSlider
@onready var game_instance: MenuManager = get_parent()
var main_index = AudioServer.get_bus_index("Master")
var music_index = AudioServer.get_bus_index("Music")
var sound_index = AudioServer.get_bus_index("Sound")

func _ready() -> void:
	main_slider.value = db_to_linear(AudioServer.get_bus_volume_db(main_index))
	music_slider.value = db_to_linear(AudioServer.get_bus_volume_db(music_index))
	sound_slider.value = db_to_linear(AudioServer.get_bus_volume_db(sound_index))

func _on_main_volume_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(main_index, linear_to_db(value))

func _on_music_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(music_index, linear_to_db(value))

func _on_sound_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(sound_index, linear_to_db(value))

func _on_full_screen_box_toggled(toggled_on: bool) -> void:
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

func _on_leave_settings_button_pressed() -> void:
	if !overlay_screen:
		push_error("Overlay screen not set in settings screen.")
		return
	if Main.game_playing:
		game_instance.switch_screen(game_instance.pause_screen, true)
	else:
		game_instance.switch_screen(game_instance.title_screen)
