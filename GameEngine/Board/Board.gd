tool
extends Node2D

signal tile_selected(tile);

var tile_scene = preload("res://GameEngine/Board/Tile/Tile.tscn");

export var width = 9;
export var height = 9;

func _ready():
	for x in range(width):
		for y in range(height):
			var tile = tile_scene.instance();
			tile.position.x = x * 23;
			tile.position.y = y * 23;
			tile.connect("selected", self, "tile_selected");
			$Tiles.add_child(tile);

func is_solved():
	for tile in $Tiles.get_children():
		if (tile.current_card == null):
			return false;
	return true;

func tile_selected(tile):
	emit_signal("tile_selected", tile);