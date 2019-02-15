extends Node2D

#warning-ignore:unused_signal
signal level_complete();

var card_scene = preload("res://GameEngine/Card/Card.tscn");
var current_card = null;

func _ready():
	get_new_card();

func get_new_card():
	current_card = card_scene.instance();
	current_card.randomize_card()
	add_child(current_card);

func _process(_delta):
	if ($Board.is_solved()):
		trigger_win();
	else:
		execute_update();

func execute_update():
	var mouse_pos = get_viewport().get_mouse_position();
	current_card.position = mouse_pos;
	if (Input.is_action_just_pressed("tile_discard")):
		discard_card();

func trigger_win():
	if ($Animation.is_playing()): return;
	current_card.visible = false;
	$Animation.play("win");

func discard_card():
	if ($Discard.has_room()):
		current_card.randomize_card();
		$Discard.increase_level();

func _on_Board_tile_selected(tile):
	if (tile.can_accept(current_card)):
		tile.place(current_card);
		$Discard.decrease_level();
		get_new_card();