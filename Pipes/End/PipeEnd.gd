extends Node2D

var Name = "PipeEnd"


func _ready():
	pass # Replace with function body.


func _on_TouchScreenButton_pressed():
	if !game.started:
		rotate(deg2rad(90))

func end():
	get_parent().get_node("AnimationPlayer").play("YouWon")
	print("you win")
	pass
