extends CharacterBody2D

@onready var anim = get_node("Flan/AnimatedSprite2D")
@onready var joystick = $Camera2D/Joystick
var dir = 0 # Store the last direction outside the function
var NPC_in_range = false
var Quest_item_in_range = false

func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	direction = joystick.posVector
	if direction:
		velocity = direction * 300
	else:
		velocity = Vector2(0,0)
		
	velocity = direction * 300
	
	# Update the chat detection range
	if Input.is_action_just_pressed("Action") and NPC_in_range == true:
		DialogueManager.show_example_dialogue_balloon(load("res://main.dialogue"), "an_com")
		return
	if Input.is_action_just_pressed("Action") and Quest_item_in_range == true:
		Global.found_quest_item = true	
	
# Update the animation when the character is moving
	if velocity.length() > 0:
	# Check joystick direction and keyboard input
		if Input.is_action_pressed("move_right") or joystick.posVector.x > 0.5 and abs(joystick.posVector.y) < 0.5:
			anim.play("Walk_Right")
			dir = 0  # Update the last direction to Right
		elif Input.is_action_pressed("move_left") or joystick.posVector.x < -0.5 and abs(joystick.posVector.y) < 0.5:
			anim.play("Walk_Left")
			dir = 1  # Update the last direction to Left
		elif Input.is_action_pressed("move_up") or joystick.posVector.y < -0.5 and abs(joystick.posVector.x) < 0.5:
			anim.play("Walk_Up")
			dir = 2  # Update the last direction to Up
		elif Input.is_action_pressed("move_down") or joystick.posVector.y > 0.5 and abs(joystick.posVector.x) < 0.5:
			anim.play("Walk_Down")
			dir = 3  # Update the last direction to Down


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






func _on_detection_area_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.has_method("Talk_NPC"):
		NPC_in_range = true
	if body.has_method("Item"):
		Quest_item_in_range = true


func _on_detection_area_body_shape_exited(body_rid, body, body_shape_index, local_shape_index):
	if body.has_method("Talk_NPC"):
		NPC_in_range = false
	if body.has_method("Item"):
		Quest_item_in_range = false
 

func character():
	pass
