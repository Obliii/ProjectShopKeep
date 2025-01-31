extends Sprite2D

@export var spawn_point_sprite: Texture

func _ready() -> void:
	if texture:
		texture = spawn_point_sprite
