extends Node


const BOARD_DIM         : Vector2i = Vector2i(7, 7)
const BOARD_SQUARE_SIZE : Vector2  = Vector2(16, 15)

const MAX_NUMBER_OF_BLUE_PIECES : int = 6
const MAX_NUMBER_OF_RED_PIECES  : int = 6


const BOARD := [
	[GameEnums.TileType.NORMAL | GameEnums.TilePlacement.BLUE_PLACEABLE, GameEnums.TileType.NORMAL | GameEnums.TilePlacement.BLUE_PLACEABLE, GameEnums.TileType.NORMAL | GameEnums.TilePlacement.BLUE_PLACEABLE, GameEnums.TileType.NORMAL, GameEnums.TileType.NORMAL | GameEnums.TilePlacement.RED_PLACEABLE, GameEnums.TileType.NORMAL | GameEnums.TilePlacement.RED_PLACEABLE, GameEnums.TileType.NORMAL | GameEnums.TilePlacement.RED_PLACEABLE],
	[GameEnums.TileType.NORMAL | GameEnums.TilePlacement.BLUE_PLACEABLE, GameEnums.TileType.NORMAL | GameEnums.TilePlacement.BLUE_PLACEABLE, GameEnums.TileType.NORMAL | GameEnums.TilePlacement.BLUE_PLACEABLE, GameEnums.TileType.NORMAL, GameEnums.TileType.NORMAL | GameEnums.TilePlacement.RED_PLACEABLE, GameEnums.TileType.NORMAL | GameEnums.TilePlacement.RED_PLACEABLE, GameEnums.TileType.NORMAL | GameEnums.TilePlacement.RED_PLACEABLE],
	[GameEnums.TileType.NORMAL | GameEnums.TilePlacement.BLUE_PLACEABLE, GameEnums.TileType.NORMAL | GameEnums.TilePlacement.BLUE_PLACEABLE, GameEnums.TileType.NORMAL | GameEnums.TilePlacement.BLUE_PLACEABLE, GameEnums.TileType.NORMAL, GameEnums.TileType.NORMAL | GameEnums.TilePlacement.RED_PLACEABLE, GameEnums.TileType.NORMAL | GameEnums.TilePlacement.RED_PLACEABLE, GameEnums.TileType.NORMAL | GameEnums.TilePlacement.RED_PLACEABLE],
	[GameEnums.TileType.NONE,                                            GameEnums.TileType.NORMAL,                                          GameEnums.TileType.NORMAL,                                          GameEnums.TileType.EXIT,   GameEnums.TileType.NORMAL,                                         GameEnums.TileType.NORMAL,                                         GameEnums.TileType.NONE],
	[GameEnums.TileType.NORMAL | GameEnums.TilePlacement.BLUE_PLACEABLE, GameEnums.TileType.NORMAL | GameEnums.TilePlacement.BLUE_PLACEABLE, GameEnums.TileType.NORMAL | GameEnums.TilePlacement.BLUE_PLACEABLE, GameEnums.TileType.NORMAL, GameEnums.TileType.NORMAL | GameEnums.TilePlacement.RED_PLACEABLE, GameEnums.TileType.NORMAL | GameEnums.TilePlacement.RED_PLACEABLE, GameEnums.TileType.NORMAL | GameEnums.TilePlacement.RED_PLACEABLE],
	[GameEnums.TileType.NORMAL | GameEnums.TilePlacement.BLUE_PLACEABLE, GameEnums.TileType.NORMAL | GameEnums.TilePlacement.BLUE_PLACEABLE, GameEnums.TileType.NORMAL | GameEnums.TilePlacement.BLUE_PLACEABLE, GameEnums.TileType.NORMAL, GameEnums.TileType.NORMAL | GameEnums.TilePlacement.RED_PLACEABLE, GameEnums.TileType.NORMAL | GameEnums.TilePlacement.RED_PLACEABLE, GameEnums.TileType.NORMAL | GameEnums.TilePlacement.RED_PLACEABLE],
	[GameEnums.TileType.NORMAL | GameEnums.TilePlacement.BLUE_PLACEABLE, GameEnums.TileType.NORMAL | GameEnums.TilePlacement.BLUE_PLACEABLE, GameEnums.TileType.NORMAL | GameEnums.TilePlacement.BLUE_PLACEABLE, GameEnums.TileType.NORMAL, GameEnums.TileType.NORMAL | GameEnums.TilePlacement.RED_PLACEABLE, GameEnums.TileType.NORMAL | GameEnums.TilePlacement.RED_PLACEABLE, GameEnums.TileType.NORMAL | GameEnums.TilePlacement.RED_PLACEABLE],
]

const BOARD_TILES_APPEAR_TIMER := [
	[0.72, 0.52, 0.40, 0.36, 0.40, 0.52, 0.72],
	[0.52, 0.32, 0.20, 0.16, 0.20, 0.32, 0.52],
	[0.40, 0.20, 0.08, 0.04, 0.08, 0.20, 0.40],
	[0.36, 0.16, 0.04, 0.00, 0.04, 0.16, 0.36],
	[0.40, 0.20, 0.08, 0.04, 0.08, 0.20, 0.40],
	[0.52, 0.32, 0.20, 0.16, 0.20, 0.32, 0.52],
	[0.72, 0.52, 0.40, 0.36, 0.40, 0.52, 0.72],
]
