extends CharacterBody2D
<<<<<<< HEAD

@onready var anim = get_node("Flan/AnimatedSprite2D")
var dir = 0 # Store the last direction outside the function

func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * 300
	
	# Update the animation when the character is moving
	if velocity.length() > 0:
		if Input.is_action_pressed("move_right"):
			anim.play("Walk_Right")
			dir = 0 # Update the last direction to Right
		elif Input.is_action_pressed("move_left"):
			anim.play("Walk_Left")
			dir = 1 # Update the last direction to Left
		elif Input.is_action_pressed("move_up"):
			anim.play("Walk_Up")
			dir = 2 # Update the last direction to Up
		elif Input.is_action_pressed("move_down"):
			anim.play("Walk_Down")
			dir = 3 # Update the last direction to Down

	# If the character is not moving, play the idle animation based on the last direction
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



=======
>>>>>>> 8e78119c29a3ca5c15d78d430216a2af98c45ebd
