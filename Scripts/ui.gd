extends CanvasLayer

class_name UI

@onready var player_points_label = $MarginContainer/PlayerPoints
@onready var enemy_points_label = $MarginContainer/EnemyPoints

var buttons: HBoxContainer

@onready var game_over_label = $GameOverLabel
@onready var congratulations_label = $CongratulationsLabel

@onready var ball = $"../Ball"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player_points_label.text = "%d" % 0
	enemy_points_label.text = "%d" % 0
	buttons = get_node("Buttons")

func update_enemy_points(points: int):
	enemy_points_label.text = "%d" % points
	if points == 5: 
		on_game_over()
	

func update_player_points(points: int):
	player_points_label.text = "%d" % points
	if points == 5: 
		on_game_won()


func on_game_over():
	buttons.visible = true
	game_over_label.visible = true
	freeze_game()
	

func on_game_won():
	buttons.visible = true
	congratulations_label.visible = true
	freeze_game()
	

func _on_restart_pressed() -> void:
	get_tree().reload_current_scene()


func _on_quit_pressed() -> void:
	get_tree().quit()


func freeze_game() -> void:
	ball.set_physics_process(false)
