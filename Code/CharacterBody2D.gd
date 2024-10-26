extends CharacterBody2D


const Jump_Velocity = -1000.0
@export var speed = 300.0
@export var jump_height = -400.0
@onready var anim = get_node("Combat_player/AnimatedSprite2D")
var dir = 0 # Store the last direction outside the function
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")



func _physics_process(delta):
	#Add gravity
	if not is_on_floor():
		velocity.y += gravity * delta
	#Handle jump
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_height
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		
	
	# Update the animation when the character is moving
	if velocity.length() > 0:
		if Input.is_action_pressed("move_right"):
			anim.play("Move_right")
			dir = 0 # Update the last direction to Right
		elif Input.is_action_pressed("move_left"):
			anim.play("Move_left")
			dir = 1 # Update the last direction to Left
		elif Input.is_action_pressed("move_up"):
			anim.play("Move_up")
			dir = 2 # Update the last direction to Up
		elif Input.is_action_pressed("move_down"):
			anim.play("Move_down")
			dir = 3 # Update the last direction to Down
			
	if velocity.length() == 0:
		match dir:
			0:
				anim.play("Idle_Right")
			1:
				anim.play("Idle_Left")
			2:
				anim.play("Idle_Up")
			3:
				anim.play("Idle_Down")
		
	move_and_slide()
