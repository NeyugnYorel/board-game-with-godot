extends Node


enum CursorType {
	CURSOR_ARROW   = 128,
	CURSOR_POINTER = 129,
}

enum GameState {
	ON_MENU      = 2048,
	BLUE_PLACING = 2049,
	RED_PLACING  = 2050,
	IN_GAME      = 2051,
}

enum TileType {
	NONE    = 0 << 0,
	NORMAL  = 1 << 0,
	EXIT    = 2 << 0,
}

enum TilePlacement {
	UNPLACEABLE    = 0 << 2,
	BLUE_PLACEABLE = 1 << 2,
	RED_PLACEABLE  = 2 << 2,
}

enum TileColor {
	AUTO    = 0 << 4,
	DARK    = 1 << 4,
	LIGHT   = 2 << 4,
}

enum TilePropExtractor {
	TYPE      = 3 << 0,
	PLACEMENT = 3 << 2,
	COLOR     = 3 << 4,
}

enum PieceColor {
	BLUE = 0,
	RED  = 1,
}

enum PieceAnimation {
	DEFAULT     = 0,
	PLACING     = 1,
	DISAPEARING = 2,
}
