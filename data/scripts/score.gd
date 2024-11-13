extends Label

@onready var score_label = $"."
var score = 0

func increase_score():
	score += 1
