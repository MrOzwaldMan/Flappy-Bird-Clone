extends CharacterBody2D

@onready var player_sprite = $AnimatedSprite2D
@onready var audio_player = $AudioStreamPlayer2D

var jump_strength: int = 600
var gravity: int = 30

var player_rotation: float = -55.0
var rotation_velocity: float = 3.0
var max_rotation: float = 90.0

func _process(delta):
	player_sprite.play("flapping")
	make_player_jump()
	apply_gravity()
	rotate_player()
	
	if position.y >= 540:
		position.y = 540
	
	move_and_slide()

func make_player_jump():
	if Input.is_action_just_pressed("Jump") and Game.is_game_lost == false:
		play_flap_sound()
		velocity.y -= jump_strength
		player_rotation = -55.0
		player_sprite.set_rotation(deg_to_rad(player_rotation))

func apply_gravity():
	velocity.y += gravity
	if velocity.y >= 1400:
		velocity.y = 1400

func rotate_player():
	if velocity.y > 0:
		player_rotation += rotation_velocity
		player_sprite.set_rotation(deg_to_rad(player_rotation))
		
		if player_rotation > max_rotation:
			player_sprite.set_rotation(deg_to_rad(max_rotation))

func play_flap_sound():
	audio_player.play()
