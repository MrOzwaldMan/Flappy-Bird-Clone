extends Node2D

@export var pipe_speed: float = 120.0

func _process(delta):
	transform.origin.x -= pipe_speed * delta
