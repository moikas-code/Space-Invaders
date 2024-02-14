extends BulletEntity

# Called when the node enters the scene tree for the first time.
func _ready():
	set_velocity(Vector2(0,speed))


func _on_hitbox_body_entered(body) -> void:
	if body == null:
		return
	if body.is_in_group("bullet"):
		body.queue_free()
		self.queue_free()
		SignalBus.emit_on_destroyed()
