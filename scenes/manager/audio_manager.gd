extends Node2D
class_name AudioManager
@onready var explosion = %explosion as AudioStreamPlayer2D
@onready var lazer = %lazer as AudioStreamPlayer2D
@onready var bomb = %bomb as AudioStreamPlayer2D
@onready var shield = %shield as AudioStreamPlayer2D
@onready var bg = %bg as AudioStreamPlayer2D


func _ready()->void:
	SignalBus.on_destroyed.connect(audio_ship_explosion)
	SignalBus.on_ship_shoot.connect(audio_ship_lazer)
	SignalBus.on_enemy_shoot.connect(audio_enemy_ship_bomb)
	SignalBus.on_shield_hit.connect(audio_shield)
	audio_bg()
	
func audio_ship_explosion()->void:
	explosion.play()

func audio_ship_lazer()->void:
	lazer.play()

func audio_enemy_ship_bomb()->void:
	bomb.play()

func audio_shield()->void:
	shield.play()
	
func audio_bg()->void:
	print("game ready")
	bg.play()
