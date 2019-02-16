extends Node2D

signal load_scene(scene);

var main_menu_scene = load("res://UI/MainMenu/MainMenu.tscn");

func _input(event):
	if (event.is_pressed()):
		emit_signal("load_scene", main_menu_scene);
		get_tree().set_input_as_handled();
