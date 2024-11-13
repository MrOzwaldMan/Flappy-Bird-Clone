extends Panel

@onready var game_over_panel = $"."
@onready var high_score_number = $"High Score Number"

func _ready():
	game_over_panel.visible = false

func _process(delta):
	if Game.is_game_lost == true:
		game_over_panel.visible = true
		high_score_number.text = str(Score.score)
