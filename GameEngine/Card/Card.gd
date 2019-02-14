extends Area2D

var CardColor = CardEnums.CardColor;
var CardShape = CardEnums.CardShape;

export(Array, Texture) var Shapes = [
	preload("res://GameEngine/Card/Art/Bunny.png"),
	preload("res://GameEngine/Card/Art/Carrot.png"),
	preload("res://GameEngine/Card/Art/Moon.png"),
	preload("res://GameEngine/Card/Art/Star.png")
];

var color = CardColor.Red;
var shape = CardShape.Bunny;

func _ready():
	randomize();
	randomize_card();

func randomize_card():
	color = randi() % CardColor.size();
	shape = randi() % CardShape.size();

func _process(_delta):
	$Sprite.texture = Shapes[shape];
	$Sprite.frame = color;