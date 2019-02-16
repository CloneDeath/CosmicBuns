extends Node2D

signal load_scene(scene);

var level_series = load("res://LevelSeries.tscn");

func _on_Start_pressed():
	emit_signal("load_scene", level_series);
