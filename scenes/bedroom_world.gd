extends Node2D

func _ready():
	$AnimatedSprite2D.hide()
	
func _pause():
	$AnimatedSprite2D.show()
	$AnimatedSprite2D.play("default_pause")

func _process(delta):
	if Input.is_action_pressed("ui_cancel"):
		_pause()
