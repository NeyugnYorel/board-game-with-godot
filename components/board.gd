extends Node2D


var board_tiles : Array = []

var game_state : GameEnums.GameState = GameEnums.GameState.BLUE_PLACING

var is_moving = false

var number_of_blue_pieces : int = 0
var number_of_red_pieces  : int = 0

signal blue_max_quanity_changed(new_max_quantity : int)
signal red_max_quanity_changed (new_max_quantity : int)

signal blue_quanity_changed(new_quantity : int)
signal red_quanity_changed (new_quantity : int)

func _ready() -> void:
	# Counters setup
	blue_max_quanity_changed.emit(GameSettings.MAX_NUMBER_OF_BLUE_PIECES)
	red_max_quanity_changed .emit(GameSettings.MAX_NUMBER_OF_RED_PIECES)
	
	blue_quanity_changed.emit(number_of_blue_pieces)
	red_quanity_changed .emit(number_of_red_pieces)
	
	# Board setup
	for y in GameSettings.BOARD_DIM.y:
		board_tiles.append([])
		#print(board_tiles)
		for x in GameSettings.BOARD_DIM.x:
			if GameSettings.BOARD[y][x] & GameEnums.TilePropExtractor.TYPE == GameEnums.TileType.NONE:
				board_tiles.back().append(null)
			else:
				var tile = GameScenes.BOARD_TILE.instantiate()
				
				board_tiles.back().append(tile)
				
				tile.set_color(GameEnums.TileColor.LIGHT if (x ^ y) & 1 else GameEnums.TileColor.DARK)
				tile.set_type(GameSettings.BOARD[y][x] & GameEnums.TilePropExtractor.TYPE)
				tile.set_placement(GameSettings.BOARD[y][x] & GameEnums.TilePropExtractor.PLACEMENT)
				tile.set_position(Vector2(x + 0.5, y + 0.5) * GameSettings.BOARD_SQUARE_SIZE)
				tile.on_click.connect(_on_board_tile_on_click)
				
				get_tree().create_timer(GameSettings.BOARD_TILES_APPEAR_TIMER[y][x]).timeout.connect(
					func add_tile():
						self.add_child(tile)
				)

func _on_board_tile_on_click(tile : Node2D) -> void:
	match game_state:
		GameEnums.GameState.BLUE_PLACING:
			if tile.placement == GameEnums.TilePlacement.BLUE_PLACEABLE:
				if tile.piece and number_of_blue_pieces > 0:
					tile.remove_piece()
					
					number_of_blue_pieces -= 1
					blue_quanity_changed.emit(number_of_blue_pieces)
				elif not tile.piece and number_of_blue_pieces < GameSettings.MAX_NUMBER_OF_BLUE_PIECES:
					var piece = GameScenes.BOARD_PIECE.instantiate()
					
					piece.set_color(GameEnums.PieceColor.BLUE)
					
					tile.place_piece(piece)
					
					number_of_blue_pieces += 1
					blue_quanity_changed.emit(number_of_blue_pieces)

#func _input(event: InputEvent) -> void:
	#if event is not InputEventMouseButton and event is not InputEventMouseMotion: return
	#
	#var mouse_position  = get_global_mouse_position()
	#var piece_index     = floor(mouse_position / GameSettings.BOARD_SQUARE_SIZE)
	#var rect_board      = Rect2(Vector2.ZERO, GameSettings.BOARD_DIM)
	#var is_inside_board = rect_board.has_point(piece_index) and GameSettings.BOARD[piece_index.y][piece_index.x] != GameEnums.SquareType.HOLE
	#
	#if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed and is_inside_board:
		#match game_state:
			#GameEnums.GameState.BLUE_PLACING:
				#if GameSettings.BOARD[piece_index.y][piece_index.x] == GameEnums.SquareType.BLUE_PLACEABLE:
					#if not board_instances[piece_index.y][piece_index.x].get_child_count() and number_of_blue_pieces < GameSettings.MAX_NUMBER_OF_BLUE_PIECES:
						#var piece = PIECE.instantiate()
						#
						#piece.set_sprite_frames(BLUE_PIECE_SPRITE_FRAMES)
						#piece.play(&"placing")
						#
						#piece.animation_finished.connect(
							#func on_animation_finished():
								#piece.set_animation(&"default")
						#)
						#
						#board_instances[piece_index.y][piece_index.x].add_child(piece)
						#
						##PiecesStorage.add_child(piece)
						#
						#number_of_blue_pieces += 1
						#
						#blue_quanity_changed.emit(number_of_blue_pieces)
						#
					#elif board_instances[piece_index.y][piece_index.x].get_child_count() and not board_instances[piece_index.y][piece_index.x].get_child(0).get_animation() == &"removing" and number_of_blue_pieces > 0:
						#var piece = board_instances[piece_index.y][piece_index.x].get_child(0)
						#
						#piece.play(&"removing")
						#
						#piece.animation_finished.disconnect(
							#piece.animation_finished.get_connections()[0].callable
						#)
						#
						#piece.animation_finished.connect(
							#func on_animation_finished():
								#if piece.get_animation() == &"removing":
									#piece.queue_free()
									##board_instances[piece_index.y][piece_index.x]
						#)
						#
						#number_of_blue_pieces -= 1
						#
						#blue_quanity_changed.emit(number_of_blue_pieces)
						#
					#elif board_instances[piece_index.y][piece_index.x].get_child_count() and board_instances[piece_index.y][piece_index.x].get_child(0).get_animation() == &"removing" and number_of_blue_pieces < GameSettings.MAX_NUMBER_OF_BLUE_PIECES:
						#var piece = board_instances[piece_index.y][piece_index.x].get_child(0)
						#
						#piece.play(&"placing")
						#
						#piece.animation_finished.disconnect(
							#piece.animation_finished.get_connections()[0].callable
						#)
						#
						#piece.animation_finished.connect(
							#func on_animation_finished():
								#piece.set_animation(&"default")
						#)
						#number_of_blue_pieces += 1
						#
						#blue_quanity_changed.emit(number_of_blue_pieces)
						#
			#GameEnums.GameState.RED_PLACING:
				#if GameSettings.BOARD[piece_index.y][piece_index.x] == GameEnums.SquareType.RED_PLACEABLE:
					#if not board_instances[piece_index.y][piece_index.x].get_child_count() and number_of_red_pieces < GameSettings.MAX_NUMBER_OF_RED_PIECES:
						#var piece = PIECE.instantiate()
						#
						#piece.set_sprite_frames(RED_PIECE_SPRITE_FRAMES)
						#piece.play(&"placing")
						#
						#piece.animation_finished.connect(
							#func on_animation_finished():
								#piece.set_animation(&"default")
						#)
						#
						#board_instances[piece_index.y][piece_index.x].add_child(piece)
						#
						##PiecesStorage.add_child(piece)
						#
						#number_of_red_pieces += 1
						#
						#red_quanity_changed.emit(number_of_red_pieces)
						#
					#elif board_instances[piece_index.y][piece_index.x].get_child_count() and not board_instances[piece_index.y][piece_index.x].get_child(0).get_animation() == &"removing" and number_of_red_pieces > 0:
						#var piece = board_instances[piece_index.y][piece_index.x].get_child(0)
						#
						#piece.play(&"removing")
						#
						#piece.animation_finished.disconnect(
							#piece.animation_finished.get_connections()[0].callable
						#)
						#
						#piece.animation_finished.connect(
							#func on_animation_finished():
								#if piece.get_animation() == &"removing":
									#piece.queue_free()
									##pieces[piece_index.y][piece_index.x] = null
						#)
						#
						#number_of_red_pieces -= 1
						#
						#red_quanity_changed.emit(number_of_red_pieces)
						#
					#elif board_instances[piece_index.y][piece_index.x].get_child_count() and board_instances[piece_index.y][piece_index.x].get_child(0).get_animation() == &"removing" and number_of_red_pieces < GameSettings.MAX_NUMBER_OF_RED_PIECES:
						#var piece = board_instances[piece_index.y][piece_index.x].get_child(0)
						#
						#piece.play(&"placing")
						#
						#piece.animation_finished.disconnect(
							#piece.animation_finished.get_connections()[0].callable
						#)
						#
						#piece.animation_finished.connect(
							#func on_animation_finished():
								#piece.set_animation(&"default")
						#)
						#number_of_red_pieces += 1
						#
						#red_quanity_changed.emit(number_of_red_pieces)
	#
	#if event is InputEventMouseMotion:
		#Main.set_cursor(GameEnums.CursorType.CURSOR_POINTER if is_inside_board else GameEnums.CursorType.CURSOR_ARROW)
 
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	#print(number_of_red_pieces)
	match game_state:
		GameEnums.GameState.BLUE_PLACING:
			pass
		GameEnums.GameState.RED_PLACING:
			pass
		GameEnums.GameState.IN_GAME:
			pass
