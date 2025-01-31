extends CanvasLayer
class_name HudScreen

@onready var health_text = $Control/VBoxContainer2/HealthLabel
@onready var enemies_remaining_text = $Control/VBoxContainer/EnemiesLabel
var player_health: int
var enemies_remaining: int

func setup_screen():
	if Main.player_character:
		Main.player_character.health_component.health_changed.connect(_on_player_health_changed)
		set_health_text(Main.player_character.health_component.health)
	if Main.current_level:
		Main.current_level.enemy_spawned.connect(_on_enemies_remaining_changed)
		set_remaining_enemies(0)

func set_health_text(value):
	health_text.text = ("Health Remaining: %s" %value)

func set_remaining_enemies(value):
	enemies_remaining = value
	enemies_remaining_text.text = ("Enemies Remaining: %s" %value)

func _on_player_health_changed(value):
	player_health = value
	health_text.text = ("Health Remaining: %s" %value)

func _on_enemies_remaining_changed(value):
	enemies_remaining = value
	enemies_remaining_text.text = ("Enemies Remaining: %s" %value)
