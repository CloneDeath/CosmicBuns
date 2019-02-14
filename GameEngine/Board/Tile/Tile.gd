extends Area2D

signal selected(tile);

var current_card = null;

func _input_event(_viewport, event, _shape_idx):
	if (event.is_action_pressed("tile_select")):
		emit_signal("selected", self);

func can_accept(_card):
	return current_card == null;

func place(card):
	card.get_parent().remove_child(card);
	card.position = Vector2(0, 0);
	add_child(card);
	current_card = card;