extends Node2D



func _ready():
	pass # Replace with function body.


func _on_Start_pressed():
	game.started = true
	$Control/Reload.visible = true
	$Control/Start.queue_free()
	pass # Replace with function body.


func _on_Reload_pressed():
	game.started = false
	get_tree().reload_current_scene()
	pass # Replace with function body.
