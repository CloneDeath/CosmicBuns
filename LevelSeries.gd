extends Node2D

signal load_scene(scene);
var you_win_scene = load("res://Levels/YouWin.tscn");

var levels = [
	load("res://Levels/Level3.tscn"),
	load("res://Levels/Level4.tscn"),
	load("res://Levels/Level5.tscn"),
	load("res://Levels/Level6.tscn"),
	load("res://Levels/Level7.tscn"),
	load("res://Levels/Level8.tscn"),
	load("res://Levels/Level9.tscn")
];

export var current_level_index = 0;
var current_level = null;

func _ready():
	load_level(current_level_index);

func load_next_level():
	if (current_level_index >= levels.size() - 1):
		emit_signal("load_scene", you_win_scene);
	if (current_level != null):
		current_level.queue_free();
	current_level_index += 1;
	load_level(current_level_index);

func load_level(level_index):
	current_level = levels[level_index].instance();
	current_level.connect("level_complete", self, "load_next_level");
	add_child(current_level);