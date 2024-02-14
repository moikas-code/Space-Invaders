extends Node2D


func _on_area_2d_body_entered(body):
	if body == null:
		return
	
	if body.is_in_group("bullet") or body.is_in_group("mothership") or body.is_in_group("bomb"):
		body.queue_free()
		SignalBus.emit_on_destroyed() 
