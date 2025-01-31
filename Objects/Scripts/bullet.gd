extends StaticBody2D
class_name Bullet

const BULLET_TIMEOUT: int = 60

@onready var sprite_2d: Sprite2D = $Sprite2D

@onready var move_component: MoveComponent = $MoveComponent
@onready var damage_component: DamageComponent = $DamageComponent
@onready var hurtbox_component: HurtboxComponent = $HurtboxComponent

@export var bullet_data : BulletData

var shooter: PhysicsBody2D


var direction: Vector2

func _ready() -> void:
	damage_component.damage = bullet_data.damage
	damage_component.armor_piercing = bullet_data.armor_piercing
	
	move_component.base_speed = bullet_data.speed
	move_component.reset_speed()
	
	sprite_2d.texture = bullet_data.texture
	
	if direction: 
		sprite_2d.look_at(position + direction)
	
	hurtbox_component.group_blacklist = shooter.get_groups()
	
	# Remove yourself after the bullet timeout elapses
	get_tree().create_timer(BULLET_TIMEOUT).timeout.connect(queue_free)
	pass

func _physics_process(delta: float) -> void:
	if direction:
		move_component.move(direction, delta)
		

func _on_hurtbox_component_hitbox_struck() -> void:
	# We've hit something so we should DISAPPEAR
	queue_free()
