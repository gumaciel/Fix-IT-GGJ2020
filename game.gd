extends Node

var started = false setget started_set

signal started_changed

func started_set(new_value):
	started = new_value
	emit_signal("started_changed")
