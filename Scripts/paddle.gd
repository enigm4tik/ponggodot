extends RigidBody2D
class_name Paddle

@export var speed = 500

func _physics_process(_delta: float) -> void:
	var movement = Vector2.ZERO
	if Input.is_action_pressed("move_up"):
		movement = Vector2.UP
	elif Input.is_action_pressed("move_down"):
		movement = Vector2.DOWN

	linear_velocity = movement * speed 
