extends Node2D

signal load_scene(scene);

var how_to_play_scene = preload("res://UI/HowToPlay/HowToPlay.tscn");

func _on_HowToPlay_pressed():
	emit_signal("load_scene", how_to_play_scene);

var level_series = load("res://LevelSeries.tscn");

func _on_Start_pressed():
	emit_signal("load_scene", level_series);
