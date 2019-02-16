extends Sprite
tool

var CardColor = CardEnums.CardColor;
var CardShape = CardEnums.CardShape;

export(Array, Texture) var Shapes = [
	preload("res://GameEngine/Card/Art/Bunny.png"),
	preload("res://GameEngine/Card/Art/Carrot.png"),
	preload("res://GameEngine/Card/Art/Moon.png"),
	preload("res://GameEngine/Card/Art/Star.png")
];

export(int, 0, 5) var color = CardColor.Red;
export(int, 0, 3) var shape = CardShape.Bunny;

func randomize_card():
	color = randi() % CardColor.size();
	shape = randi() % CardShape.size();

func _process(_delta):
	texture = Shapes[shape];
	frame = color;