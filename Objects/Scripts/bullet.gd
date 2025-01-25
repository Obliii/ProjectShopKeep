extends StaticBody2D
class_name Bullet

@onready var sprite_2d: Sprite2D = $Sprite2D

@onready var move_component: MoveComponent = $MoveComponent

@export var bullet_data : BulletData

var direction: Vector2

func _physics_process(delta: float) -> void:
	if direction:
		move_component.move(direction, delta)

func _ready() -> void:
	# gotta set up the damage somewhat
	pass
