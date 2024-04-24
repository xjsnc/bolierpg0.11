extends CharacterBody2D

const speed = 100
var current_dir = "none"

func _physics_process(delta):
	player_movement(delta)
	
func player_movement(delta):
	if Input.is_action_pressed("ui_right"):
		current_dir = "right"
		play_anim()
		velocity.x = speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_left"):
		current_dir = "left"
		play_anim()
		velocity.x = -speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_down"):
		current_dir = "down"
		play_anim()
		velocity.x = 0
		velocity.y = speed
	elif Input.is_action_pressed("ui_up"):
		current_dir = "up"
		play_anim()
		velocity.x = 0
		velocity.y = -speed
	else: 
		velocity.x = 0
		velocity.y = 0
		
	move_and_slide()

func play_anim():
	var dir = current_dir
	var anim = $AnimatedSprite2D
	
	if dir == "right":
		anim.flip_h = false
		anim.play("side_walk")
	elif dir == "left":
		anim.flip_h = true
		anim.play("side_walk")
	elif dir == "down":
		anim.flip_h = true
		anim.play("front_walk")
	elif dir == "up":
		anim.flip_h = true
		anim.play("back_walk")
	
		
#if movement = 0: play idle
#elif movement = 1: play walk
#put movement into function para later
	

