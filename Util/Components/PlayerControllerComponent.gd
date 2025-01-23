extends Node
class_name PlayerControllerComponent

# Component dependencies
@export var move_component: MoveComponent
@export var weapon_component: WeaponComponent
@export var animation_component: AnimationComponent

# Other
@export var animated_sprite: AnimatedSprite2D
@export var character_body: CharacterBody2D 

func _physics_process(delta: float) -> void:
	move_character(delta)
	fire_weapon()
	dash()
	activate_ability()

# Moves the character!
func move_character(delta):
	var vec: Vector2 = Input.get_vector("move_left","move_right","move_up","move_down").normalized()
	move_component.move(vec, delta)
	play_movement_animation(vec)

# Fires the weapons with Left Click or Right Click.
func fire_weapon():
	var mouse_position: Vector2 = character_body.get_global_mouse_position()
	weapon_component.rotate_weapon(mouse_position)
	
	# If the mouse is being fire in it's direction. If not, then fire in the direction that the player is facing.
	if Input.is_action_pressed("move_shootprimary") and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		weapon_component.fire_primary_weapon(mouse_position)
	elif Input.is_action_pressed("move_shootsecondary") and Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
		weapon_component.fire_secondary_weapon(mouse_position)

# Activates the knife's spinning attack.
func activate_ability():
	if Input.is_action_just_pressed("move_spin_attack") and animation_component.can_animate:
		animation_component.start_animation("spin", true, false)

# Causes the entity to have a short burst of speed.
func dash():
	if Input.is_action_just_pressed("move_dash") and move_component.can_dash and animation_component.can_animate:
		move_component.dash()
		animation_component.start_animation("stab", true, false)

# Causes the entity to have a walking animation if applicable.
func play_movement_animation(vec):
	if vec != Vector2.ZERO and animation_component.can_animate:
		animation_component.start_animation("bounce", false, true)
	elif vec == Vector2.ZERO and animation_component.can_animate:
		animation_component.stop_animation()
