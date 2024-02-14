extends Node2D
class_name EndGameZone



func _on_area_2d_body_entered(body):
	if body == null:
		return
	if body.is_in_group("alien"):
		SignalBus.emit_on_game_over()
