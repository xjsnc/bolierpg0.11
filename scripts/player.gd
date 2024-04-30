extends CharacterBody2D

var speed = 100
var current_dir = "down"
var start_idle = "first"
var idk = 0
var screen_size

func _ready():
	get_node("CollisionShape2D").disabled = false
	$Camera2D/PauseScreen.hide()

func _pause():
	$Camera2D/PauseScreen.show()
	get_tree().paused = true

func _start():
	play_anim(0)
#play front idle

func _physics_process(delta):
	var screen_size = "pass"
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		current_dir = "right"
		play_anim(1)
		velocity.x += speed
	elif Input.is_action_pressed("ui_left"):
		current_dir = "left"
		play_anim(1)
		velocity.x -= speed
	elif Input.is_action_pressed("ui_down"):
		current_dir = "down"
		play_anim(1)
		velocity.y += speed
	elif Input.is_action_pressed("ui_up"):
		current_dir = "up"
		play_anim(1)
		velocity.y -= speed
	else: 
		play_anim(0)
		velocity.x = 0
		velocity.y = 0
		
	if Input.is_action_pressed("ui_cancel"):
		_pause()
	
	move_and_slide()
	position += velocity * delta

func play_anim(movement):
	var dir = current_dir
	var anim = $AnimatedSprite2D
	anim.speed_scale = 1
	
	if dir == "right":
		anim.flip_h = false
		if movement == 0:
			anim.play("side_idle")
		elif movement == 1:
			anim.play("side_walk")
	elif dir == "left":
		anim.flip_h = true
		if movement == 0:
			anim.play("side_idle")
		elif movement == 1:
			anim.play("side_walk")
	elif dir == "down":
		anim.flip_h = true
		if movement == 0:
			anim.play("front_idle_1")
			if anim.frame == 7:
				if anim.frame_progress >= 0.50:
					anim.frame=6
				anim.speed_scale = 0.5
			else:
				anim.speed_scale = 1
		elif movement == 1:
			anim.play("front_walk")
	elif dir == "up":
		anim.flip_h = true
		if movement == 0:
			anim.play("back_idle_1")
			if anim.frame == 5:
				if anim.frame_progress >= 0.50:
					anim.frame=4
				anim.speed_scale = 0.5
			else:
				anim.speed_scale = 1
		elif movement == 1:
			anim.play("back_walk")

func first_part(anim):
	anim.play("front_idle_1")


func _on_resume_button_pressed():
	get_tree().paused = false
	$Camera2D/PauseScreen.hide()

func _on_quit_button_pressed():
	get_tree().quit()
