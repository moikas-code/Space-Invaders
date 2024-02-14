extends Node


var currently_held_coins : int= 0;

func get_current_coin()->int:
	return currently_held_coins
	
func add_coin(value:int)->void:
	currently_held_coins+=value
	
func remove_coin(value:int)->void:
	currently_held_coins-=value
