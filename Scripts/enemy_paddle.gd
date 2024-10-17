extends RigidBody2D

@export var paddle_speed = 40000
@export var ball: Ball
@export var multiplier = 1.1

func _physics_process(delta: float) -> void:
	var direction = (ball.position - position).normalized()
	linear_velocity.y = direction.y * paddle_speed * delta 

func make_faster():
	linear_velocity = Vector2.ZERO
	paddle_speed *= multiplier
