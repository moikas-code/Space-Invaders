extends Control
class_name ScoreUI

@onready var score_value = $MarginContainer/VBoxContainer/HBoxContainer/Score_Value

var current_score = 0

func  _ready() ->void:
	score_value.text =  str(current_score)
	SignalBus.on_enemy_death.connect(on_enemy_death)
	
func on_enemy_death(points)->void:
	current_score += points
	score_value.text = str(current_score)
	print(NodeExtensions.get_size_of_group("alien") )
	if NodeExtensions.get_size_of_group("alien")-1 <= 0:
		SignalBus.emit_on_game_win()
