extends Node2D

var current_scene: Node = null;

func _ready():
	var main_menu_scene = load("res://UI/MainMenu/MainMenu.tscn");
	load_scene(main_menu_scene);

func load_scene(scene: PackedScene):
	if (current_scene != null):
		current_scene.queue_free();
	current_scene = scene.instance();
	add_child(current_scene);
	current_scene.connect("load_scene", self, "load_scene");
