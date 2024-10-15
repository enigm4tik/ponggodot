extends Node2D

var player_points = 0
var enemy_points = 0

@onready var enemy = $Enemy
@onready var player = $Player
@onready var ball: Ball = $Ball
@onready var ui: UI = $UI

func _on_enemy_scored() -> void:
	enemy_points += 1
	ui.update_enemy_points(enemy_points)
	reset_game_state()


func _on_player_scored() -> void:
	player_points += 1
	ui.update_player_points(player_points)
	reset_game_state()


func reset_game_state():
	enemy.global_position.y = 0
	player.global_position.y = 0
	player.global_position.x = -1000
	ball.global_position = Vector2.ZERO
	ball.velocity = Vector2.ZERO
	enemy.linear_velocity = Vector2.ZERO
	player.linear_velocity = Vector2.ZERO
	ball.start_ball()
