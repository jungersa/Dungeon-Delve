extends CharacterBody2D


@export var SPEED = 1


func handle_input(delta):
	var move_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = move_direction * SPEED * 1/delta

func update_animation():
	$AnimatedSprite2D.play()
	var animation = "Idle"
	
	if velocity.x < 0 : 
		animation = "MoveX"
		$AnimatedSprite2D.flip_h = true
	elif velocity.x > 0 : 
		animation = "MoveX"
		$AnimatedSprite2D.flip_h = false
	elif velocity.y < 0 : animation = "MoveUp"
	elif velocity.y > 0 : animation = "MoveDown"
	
	$AnimatedSprite2D.animation = animation

func _physics_process(delta):
	handle_input(delta)
	update_animation()
	move_and_slide()

