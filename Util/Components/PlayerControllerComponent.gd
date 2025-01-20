extends Node
class_name PlayerControllerComponent

@export var animated_sprite: AnimatedSprite2D
@export var character_body: CharacterBody2D 

func _physics_process(delta: float) -> void:
	move_character()

func move_character():
	var move: Vector2i = Input.get_vector("move_left","move_right","move_up","move_down")
	
