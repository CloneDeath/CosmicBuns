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
			$Level0.frame = 0;
			$Level1.frame = 3;
			$Level2.frame = 6;
		1:
			$Level0.frame = 1;
			$Level1.frame = 3;
			$Level2.frame = 6;
		2:
			$Level0.frame = 2;
			$Level1.frame = 4;
			$Level2.frame = 6;
		3:
			$Level0.frame = 2;
			$Level1.frame = 5;
			$Level2.frame = 7;