extends MainMenu
class_name EndGame

func _ready():
	%menu.pressed.connect(_to_menu)
	%try_again.pressed.connect(_to_game)
	
func _to_menu()->void:
	get_tree().change_scene_to_packed(load("res://scenes/levels/main_menu.tscn"))

func _to_game():
	get_tree().change_scene_to_packed(load("res://scenes/levels/main.tscn"))
