extends Node


class Piece:
	static var SPRITE_FRAMES := {
		GameEnums.PieceColor.BLUE : preload("res://assets/sprite_frames/blue_piece.tres"),
		GameEnums.PieceColor.RED  : preload("res://assets/sprite_frames/red_piece.tres")
	}
	
	static var ANIMATIONS := {
		GameEnums.PieceAnimation.DEFAULT     : &"default",
		GameEnums.PieceAnimation.PLACING     : &"placing",
		GameEnums.PieceAnimation.DISAPEARING : &"removing",
	}

class Tile:
	static var SPRITE_FRAMES := {
		GameEnums.TileColor.DARK  : preload("res://assets/sprite_frames/dark_tile.tres"),
		GameEnums.TileColor.LIGHT : preload("res://assets/sprite_frames/light_tile.tres")
	}
	
	static var ANIMATIONS := {
		GameEnums.TileType.EXIT   : &"door_opening",
		GameEnums.TileType.NORMAL : &"default",
		GameEnums.TileType.NONE   : &""
	}

class Cursor:
	static var TEXTURES := {
		GameEnums.CursorType.CURSOR_ARROW   : preload("res://assets/textures/cursor/cursor_arrow.png"),
		GameEnums.CursorType.CURSOR_POINTER : preload("res://assets/textures/cursor/cursor_pointer.png")
	}
