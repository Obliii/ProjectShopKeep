extends Node
class_name AIComponent

@export var move_component: MoveComponent
@export var weapon_component: WeaponComponent
@export var navigation_agent_2d: NavigationAgent2D


@onready var enemy: Enemy = get_owner()




var player: Player

func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")

func _process(_delta: float) -> void:
	navigation_agent_2d.target_position = player.global_position

func _physics_process(delta: float) -> void:
	move_character(delta)
	fire_primary_weapon()
	# dash()

func move_character(delta):
	if !ai_in_range():
		var vec: Vector2 = enemy.global_position.direction_to(navigation_agent_2d.get_next_path_position())
		move_component.move(vec, delta)

func fire_primary_weapon():
	if ai_in_range():
		weapon_component.fire_primary_weapon(player_direction())
	pass

func fire_secondary_weapon():
	pass

func activate_ability():
	pass

func dash():
	if Input.is_action_just_pressed("move_dash"):
		move_component.dash()

func ai_in_range() -> bool:
	return enemy.position.distance_to(player.position) < weapon_component.weapon_data.ai_attack_range

func player_direction() -> Vector2:
	return (player.global_position - enemy.global_position).normalized()
