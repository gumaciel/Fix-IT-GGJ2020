extends Node2D

var Name = "PipeStart"


func _ready():
	game.connect("started_changed", self, "_on_started_changed")
	pass # Replace with function body.


func _on_started_changed():
	if game.started:
		$AnimationPlayer.play("Start")

func _on_TouchScreenButton_pressed():
	if !game.started:
		rotate(deg2rad(90))

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Start":
		if $RayCast2D.is_colliding():
			var Pipe : Node2D = $RayCast2D.get_collider().get_parent()
			var Side : Node2D = $RayCast2D.get_collider()
			if Pipe.Name == "PipeCorner":
				corner_collider(Pipe, Side)
			if Pipe.Name == "PipeHorizontal":
				horizontal_collider(Pipe, Side)
		else:
			game.started = false
			get_tree().reload_current_scene()

	pass # Replace with function body.

func corner_collider(Pipe : Node2D, Side : Node2D):
	if Pipe.Right == Side:
		Side.queue_free()
		Pipe.play_right_animation()
	elif Pipe.Bottom == Side:
		Side.queue_free()
		Pipe.play_bottom_animation()
	pass
func horizontal_collider(Pipe : Node2D, Side : Node2D):
	if Pipe.Right == Side:
		Side.queue_free()
		Pipe.play_right_animation()
	elif Pipe.Left == Side:
		Side.queue_free()
		Pipe.play_left_animation()
	pass
