extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameFunctions.set_cursor(GameEnums.CursorType.CURSOR_ARROW)
