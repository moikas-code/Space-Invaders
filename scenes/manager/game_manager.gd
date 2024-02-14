extends Node2D
class_name GameManager

@export var max_lazers = 1
@export var max_lives = 3
var current_lives  =  max_lives

# Called when the node enters the scene tree for the first time.
func _ready():
	on_game_ready()
	SignalBus.emit_on_game_start()
	SignalBus.on_player_death.connect(on_player_death)
	SignalBus.on_game_win.connect(on_game_win)
	SignalBus.on_game_over.connect(on_game_over)
	
	
func on_game_ready():
	print("ready")
	SignalBus.emit_on_game_start()

func get_max_lazers()->int:
	return max_lazers

func on_player_death() ->void:
	current_lives -= 1
	if current_lives == 0:
		on_game_over()

func on_game_win() -> void:
	get_tree().change_scene_to_packed(load("res://scenes/levels/youwin.tscn"))

func on_game_over() -> void:
	get_tree().change_scene_to_packed(load("res://scenes/levels/gameover.tscn"))
