extends Node2D

@export var pipe_speed: float = 120.0

@onready var score_sound = $ScoreSound
@onready var hit_sound = $HitSound
@onready var fall_sound = $FallSound

func _process(delta):
	if Game.is_game_lost == false: 
		transform.origin.x -= pipe_speed * delta


func _on_score_area_2d_body_entered(body):
	Score.increase_score()
	score_sound.play()


func _on_area_2d_body_entered(body):
	Game.is_game_lost = true
	hit_sound.play()


func _on_hit_sound_finished():
	fall_sound.play()
