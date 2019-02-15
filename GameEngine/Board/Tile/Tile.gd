extends Area2D

signal selected(tile);

var current_card = null;

func _input_event(_viewport, event, _shape_idx):
	if (event.is_action_pressed("tile_select")):
		emit_signal("selected", self);

func can_accept(card):
	if (current_card != null): return false;
	if (!is_compatible(Vector2(25, 0), card)): return false;
	if (!is_compatible(Vector2(-25, 0), card)): return false;
	if (!is_compatible(Vector2(0, 25), card)): return false;
	if (!is_compatible(Vector2(0, -25), card)): return false;
	return true;

func is_compatible(dp, card):
	var space_state = get_world_2d().direct_space_state;
	var results = space_state.intersect_point(self.global_position + dp, 32, [], 0x7FFFFFFF, true, true);
	if (results.size() == 0):
		return true;
	else:
		var other = results[0].collider;
		if (!other.is_in_group("tile")): return true;
		if (other.current_card == null):
			return true;
		else:
			var other_card = other.current_card;
			return other_card.color != card.color && other_card.shape != card.shape;

func place(card):
	card.get_parent().remove_child(card);
	card.position = Vector2(0, 0);
	add_child(card);
	current_card = card;