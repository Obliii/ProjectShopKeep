extends Node
class_name PlayerControllerComponent

@export var move_component: MoveComponent
@export var weapon_component: WeaponComponent
@export var animated_sprite: AnimatedSprite2D
@export var character_body: CharacterBody2D 

func _physics_process(delta: float) -> void:
	move_character(delta)
	fire_weapon()
	dash()

func move_character(delta):
	var vec: Vector2 = Input.get_vector("move_left","move_right","move_up","move_down").normalized()
	move_component.move(vec, delta)

func fire_weapon():
	var mouse_position: Vector2 = character_body.get_global_mouse_position() - character_body.position
	
	# If the mouse is being fire in it's direction. If not, then fire in the direction that the player is facing.
	if Input.is_action_pressed("move_shootprimary") and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		weapon_component.fire_primary_weapon(mouse_position)
	elif Input.is_action_pressed("move_shootsecondary") and Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
		weapon_component.fire_secondary_weapon(mouse_position)
		
func activate_ability():
	pass

func dash():
	if Input.is_action_just_pressed("move_dash"):
		move_component.dash()
