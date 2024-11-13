extends Node2D

@onready var pipe_scene = preload("res://data/scenes/pipe.tscn")
@onready var score_label = $Score

var is_game_lost = false

func _process(delta):
	if score_label != null:
		score_label.text = str(Score.score)

func spawn_pipe():
	var pipe_instance = pipe_scene.instantiate()
	
	pipe_instance.position.x = 1102
	pipe_instance.position.y = randi_range(288, 698)
	add_child(pipe_instance)

func _on_pipe_spawn_timer_timeout():
	spawn_pipe()

func _on_destroy_pipe_area_area_entered(area: Area2D):
	area.queue_free()
