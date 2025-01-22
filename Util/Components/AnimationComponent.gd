extends Node
class_name AnimationComponent

@export var animation_player: AnimationPlayer

#This dictates if another animation can occur over the ongoing one.
var can_animate: bool = true  

# Starts the animation unless the current animation is special.
func start_animation(anim_name, is_special = false):
	if can_animate:
		animation_player.play(anim_name)
	if is_special:
		can_animate = false

# Stops the ongoing animation and allows others to occur.
func stop_animation():
	animation_player.stop(false)
	can_animate = true

# Allows more special animations to happen after the ongoing special animation is complete.
func _on_animation_player_animation_finished(_anim_name) -> void:
	can_animate = true
	animation_player.play("RESET")
