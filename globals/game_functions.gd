extends Node


func set_cursor(cursor_type : GameEnums.CursorType) -> void:
	Input.set_custom_mouse_cursor(GameVisuals.Cursor.TEXTURES[cursor_type], Input.CURSOR_ARROW, Vector2.ZERO)
