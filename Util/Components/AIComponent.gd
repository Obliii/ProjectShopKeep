extends Node
class_name AIComponent

@export var move_component: MoveComponent

@onready var enemy: Enemy = get_owner()

var player: Player

func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")

func _physics_process(delta: float) -> void:
	move_character(delta)
	# dash()

func move_character(delta):
	var vec: Vector2 = (player.global_position - enemy.global_position).normalized()
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
