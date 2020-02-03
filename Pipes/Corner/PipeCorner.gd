extends Node2D

onready var Bottom = $Bottom
onready var Right = $Right

var Name = "PipeCorner"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_TouchScreenButton_pressed():
	if !game.started:
		rotate(deg2rad(90))

func play_bottom_animation():
	$WaterBottom.visible = true
	$AnimationPlayer.play("WaterBottom")

func play_right_animation():
	$WaterRight.visible = true
	$AnimationPlayer.play("WaterRight")


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "WaterBottom":
		if $Right/RayRight.is_colliding():
			var Pipe : Node2D = $Right/RayRight.get_collider().get_parent()
			var Side : Node2D = $Right/RayRight.get_collider()
			if Pipe.Name == "PipeEnd":
				end_collider(Pipe, Side)
			elif Pipe.Name == "PipeCorner":
				corner_collider(Pipe, Side)
			elif Pipe.Name == "PipeHorizontal":
				horizontal_collider(Pipe, Side)
			else:
				game.started = false
				get_tree().reload_current_scene()
		else:
			game.started = false
			get_tree().reload_current_scene()
	elif anim_name == "WaterRight":
		if $Bottom/RayBottom.is_colliding():
			var Pipe : Node2D = $Bottom/RayBottom.get_collider().get_parent()
			var Side : Node2D = $Bottom/RayBottom.get_collider()
			if Pipe.Name == "PipeEnd":
				end_collider(Pipe, Side)
			elif Pipe.Name == "PipeCorner":
				corner_collider(Pipe, Side)
			elif Pipe.Name == "PipeHorizontal":
				horizontal_collider(Pipe, Side)
			else:
				game.started = false
				get_tree().reload_current_scene()
		else:
			game.started = false
			get_tree().reload_current_scene()
	pass # Replace with function body.

func end_collider(Pipe : Node2D, Side : Node2D):
	Pipe.end()
	pass
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
