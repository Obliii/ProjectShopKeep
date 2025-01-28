extends Node2D

#Dependencies
@export var game_overlay: OverlayScreen

var current_map: Node2D
signal enemies_all_killed

# Remove the old map and spawn in the new one.
func init_new_map(to_load: PackedScene):
	game_overlay.hide_screen(true)
	var map = await load_new_map(to_load)
	if current_map:
		current_map.queue_free()
	current_map = map
	add_child(current_map)
	game_overlay.hide_screen(false)

# Fades the screen and loads in the new map.
func load_new_map(new_packed_scene: PackedScene):
	var result: PackedScene = ResourceLoader.load(new_packed_scene.resource_path)
	result.instantiate()
	return result
