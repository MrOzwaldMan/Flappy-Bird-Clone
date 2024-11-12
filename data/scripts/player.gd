extends CharacterBody2D

@onready var player_sprite = $Sprite2D

var jump_strength: int = 500
var gravity: int = 30

var player_rotation: float = -55.0
var rotation_velocity: float = 3.0
var max_rotation: float = 90.0

func _process(delta):
	make_player_jump()
	apply_gravity()
	rotate_player()
	move_and_slide()

func make_player_jump():
	if Input.is_action_just_pressed("Jump"):
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
