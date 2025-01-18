extends Node
class_name StateMachine 

@export var starting_game_state: State
var current_state: State
var states: Dictionary = {}

func _ready():
	for child in get_children():
		if child is State:
			child.parent = get_parent()
			states[child.name.to_lower()] = child
			child.state_machine = self
	
	if starting_game_state:
		current_state = starting_game_state
		current_state._enter_state()

func _process(_delta: float) -> void:
	if current_state:
		current_state._update_process(_delta)

func _physics_process(_delta: float) -> void:
	if current_state:
		current_state._update_physics(_delta)

func _enter_new_game_state(new_state):
	# If the state is already there, don't process further.
	if new_state == current_state:
		return
	
	# Exit old State and enter into new state.
	if current_state != null:
		current_state._exit_state()
		
	current_state = new_state
	current_state._enter_state()
	print("Entered into %s" %new_state)
