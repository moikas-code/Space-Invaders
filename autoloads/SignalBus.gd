extends Node

signal on_game_manager_ready
signal on_player_ready(player:PlayerEntity)
signal on_enemy_death(points:int)
signal on_player_death

signal on_game_start
signal on_game_win
signal on_game_over

#Audio Signals
signal on_ship_shoot
signal on_enemy_shoot
signal on_destroyed
signal on_shield_hit


func emit_on_game_manager_ready() -> void:
	on_game_manager_ready.emit()

func emit_on_game_start()->void:
	on_game_start.emit()	
	
func emit_on_game_win()->void:
	on_game_win.emit()

func emit_on_game_over()->void:
	on_game_over.emit()
	
func emit_on_player_ready(player:PlayerEntity)->void:
	on_player_ready.emit(player)

func emit_on_enemy_death(points:int)->void:
	on_enemy_death.emit(points)
	
func emit_on_player_death()->void:
	on_player_death.emit()



#Audio
func emit_on_ship_shoot()->void:
	on_ship_shoot.emit()

func emit_on_enemy_shoot()->void:
	on_enemy_shoot.emit()

func emit_on_destroyed()->void:
	on_destroyed.emit()

func emit_on_shield_hit()->void:
	on_shield_hit.emit()

