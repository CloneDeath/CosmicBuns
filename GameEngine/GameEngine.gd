extends Node2D

var card_scene = preload("res://GameEngine/Card/Card.tscn");

var current_card = null;

func _ready():
	get_new_card();

func get_new_card():
	current_card = card_scene.instance();
	current_card.randomize_card()
	add_child(current_card);

func _process(_delta):
	var mouse_pos = get_viewport().get_mouse_position();
	current_card.position = mouse_pos;

	if (Input.is_action_just_pressed("tile_discard")):
		if ($Discard.has_room()):
			current_card.randomize_card();
			$Discard.increase_level();

func _on_Board_tile_selected(tile):
	if (tile.can_accept(current_card)):
		tile.place(current_card);
		$Discard.decrease_level();
		get_new_card();