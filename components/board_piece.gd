extends Node2D


@export var PieceVisual : Node2D

var color : GameEnums.TileColor

func set_color(tile_color : GameEnums.TileColor) -> void:
	self.color = tile_color
	PieceVisual.set_sprite_frames(GameVisuals.Piece.SPRITE_FRAMES[self.color])

func play_animation(animation : GameEnums.PieceAnimation) -> Signal:
	PieceVisual.play(GameVisuals.Piece.ANIMATIONS[animation])
	return PieceVisual.animation_finished

func _on_piece_visual_animation_finished() -> void:
	PieceVisual.set_animation(GameVisuals.Piece.ANIMATIONS[GameEnums.PieceAnimation.DEFAULT])
