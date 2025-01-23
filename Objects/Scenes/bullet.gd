extends StaticBody2D
class_name Bullet

@onready var move_component: MoveComponent = $MoveComponent

var direction: Vector2

func _physics_process(delta: float) -> void:
	if direction:
		move_component.move(direction, delta)
