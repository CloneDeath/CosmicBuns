extends Node2D

var level = 0;

func is_full():
	return level >= 3;

func has_room():
	return !is_full();

func increase_level():
	level += 1;
	if (level >= 3): level = 3;

func decrease_level():
	level -= 1;
	if (level <= 0): level = 0;

func _process(_delta):
	match level:
		0:
			set_animation("empty");
		1:
			set_animation("level1");
		2:
			set_animation("level2");
		3:
			set_animation("level3");

func set_animation(animation):
	if ($Animation.current_animation != animation):
		$Animation.play(animation);