extends Node
class_name PlayerControllerComponent

@export var move_component: MoveComponent
@export var animated_sprite: AnimatedSprite2D
@export var character_body: CharacterBody2D 

func _physics_process(delta: float) -> void:
	move_character(delta)
	dash()

func move_character(delta):
	var vec: Vector2 = Input.get_vector("move_left","move_right","move_up","move_down").normalized()
	move_component.move(vec, delta)

func fire_primary_weapon():
	pass

func fire_secondary_weapon():
	pass

func activate_ability():
	pass

func dash():
	if Input.is_action_just_pressed("move_dash"):
		move_component.dash()
