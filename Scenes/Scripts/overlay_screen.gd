extends CanvasLayer
class_name OverlayScreen

@export var animation_player: AnimationPlayer
var screen_hidden: bool

func hide_screen(value):	
	screen_hidden = value
	if screen_hidden:
		animation_player.play("hide_screen")
	else:
		animation_player.play("unhide_screen")
	await animation_player.animation_finished
