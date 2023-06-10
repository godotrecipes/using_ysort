extends CharacterBody2D

var run_speed = 80

func get_input():
	var right = Input.is_action_pressed("ui_right")
	var left = Input.is_action_pressed("ui_left")
	var up = Input.is_action_pressed("ui_up")
	var down = Input.is_action_pressed("ui_down")
	
	velocity = Vector2.ZERO
	if right:
		velocity.x += 1
		$Sprite2D.scale.x = 1
	if left:
		velocity.x -= 1
		$Sprite2D.scale.x = -1
	if up:
		velocity.y -= 1
	if down:
		velocity.y += 1
	velocity = velocity.normalized() * run_speed
	if velocity.length() > 0:
		$AnimationPlayer.play("run")
	else:
		$AnimationPlayer.play("idle")

func _physics_process(delta):
	get_input()
	move_and_slide()
