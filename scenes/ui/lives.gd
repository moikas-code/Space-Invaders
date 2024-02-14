extends Control
class_name LivesUI
@onready var life_3 = $MarginContainer/VBoxContainer/HBoxContainer/Life3
@onready var life_2 = $MarginContainer/VBoxContainer/HBoxContainer/Live2
@onready var life_1 = $MarginContainer/VBoxContainer/HBoxContainer/Life1
var life_index = 0;

func _ready() ->void:
	SignalBus.on_player_death.connect(on_player_death)
	
func on_player_death():
	match life_index:
		0:
			life_1.queue_free()
			life_index += 1
		1:
			life_2.queue_free()
			life_index += 1
		2:
			life_3.queue_free()
			life_index += 1
