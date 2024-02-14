extends StaticBody2D
class_name Bunker
@onready var sprite_2d = $Sprite2D
@onready var collision_shape_2d = $CollisionShape2D
@export var max_health = 5

var health = max_health

func _on_hitbox_body_entered(body) -> void:
	if body == null:
		return
	if body.is_in_group("bullet") or body.is_in_group("bomb"):
		body.queue_free()
		health -=1
		if health == 0:
			self.queue_free()
			SignalBus.emit_on_destroyed()
		else:
			SignalBus.emit_on_shield_hit()
	if body.is_in_group("alien"):
		SignalBus.emit_on_game_over()
