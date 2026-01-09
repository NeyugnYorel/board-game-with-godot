extends Node2D


@export var TileCore    : Node2D
@export var TileVisual  : Node2D
@export var PieceSlot   : Node2D
@export var AnchorPoint : Node2D

var color     : GameEnums.TileColor
var placement : GameEnums.TilePlacement
var type      : GameEnums.TileType 
var piece     : Node2D

signal on_click(tile : Node2D)

func set_offset(offset : Vector2):
	AnchorPoint.position = offset

func set_color(tile_color : GameEnums.TileColor) -> void:
	TileVisual.set_sprite_frames(GameVisuals.Tile.SPRITE_FRAMES[tile_color])
	self.color = tile_color

func set_placement(tile_placement : GameEnums.TilePlacement) -> void:
	self.placement = tile_placement

func remove_piece() -> void:
	if PieceSlot.get_child_count():
		var piece_temp = self.piece
		self.piece.play_animation(GameEnums.PieceAnimation.DISAPEARING).connect(
			func deleting():
				if is_instance_valid(piece_temp):
					PieceSlot.remove_child(piece_temp)
					piece_temp.queue_free()
		)
	self.piece = null

func place_piece(board_piece : Node2D) -> void:
	if PieceSlot.get_child_count():
		var piece_temp = PieceSlot.get_child(0)
		PieceSlot.remove_child(piece_temp)
		piece_temp.queue_free()
	board_piece.play_animation(GameEnums.PieceAnimation.PLACING)
	PieceSlot.add_child(board_piece)
	self.piece = board_piece

func set_type(tile_type : GameEnums.TileType) -> void:
	TileVisual.set_animation(GameVisuals.Tile.ANIMATIONS[tile_type])
	self.type = tile_type

func play_animation() -> void:
	TileVisual.play()

func _on_tile_core_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is not InputEventMouseButton: return
	
	if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		on_click.emit(self)
