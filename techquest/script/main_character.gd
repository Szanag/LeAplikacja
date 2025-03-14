extends CharacterBody2D
	
@export var movement_speed = 100
@export var sprint_speed = 200
@export var starting_direction = Vector2(0, 1)

@onready var animation_tree = $AnimationTree
@onready var state_machine = animation_tree.get("parameters/playback")

func _ready():
	animation_tree.set("parameters/idle/blend_position", starting_direction)

func _physics_process(_delta):
	var  input_direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)
	
	update_animation_parameters(input_direction)
	
	if  Input.is_action_pressed("sprint"):
		velocity = input_direction * sprint_speed
	else :
		velocity = input_direction * movement_speed
	
	move_and_slide()
	
	new_state()
	
func update_animation_parameters(move_input : Vector2):
	if (move_input != Vector2.ZERO):
		animation_tree.set("parameters/walk/blend_position", move_input)
		animation_tree.set("parameters/idle/blend_position", move_input)
		
func new_state():
	if velocity != Vector2.ZERO:
		state_machine.travel("walk")
	else: 
		state_machine.travel("idle")
		
