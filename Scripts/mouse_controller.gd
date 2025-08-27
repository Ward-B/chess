extends Node2D

var board

var selected_piece = null

signal tile_clicked(tile)
signal piece_clicked(piece)

#func _input(event):
#	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
#		_handle_mouse_click(event.position)

func _ready() -> void:
	board = get_parent().get_parent().get_node("BoardManager").get_node("BoardLayer")

func _unhandled_input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		_handle_mouse_click(event.position)
		
func _handle_mouse_click(position):
	_determine_cell()
	var piece = _get_piece_at_position(get_global_mouse_position())
	if piece:
		piece_clicked.emit(piece)
		#_select_piece(piece)
	#else:
	#	_deselect_current()
	
func _get_piece_at_position(pos):
	var space_state = get_world_2d().direct_space_state
	var params := PhysicsPointQueryParameters2D.new()
	params.position = pos
	params.collide_with_areas = true
	params.collide_with_bodies = true
	var result = space_state.intersect_point(params, 32)
	for r in result:
		var col = r.collider
		if col.is_in_group("chess_pieces"):
			return col.get_parent() # this should return the ChessPiece
		if col.get_parent() and col.get_parent().is_in_group("chess_pieces"):
			return col.get_parent()
	return null

func _determine_cell():
	var localPos = board.to_local(get_global_mouse_position())
	var cell = board.local_to_map(localPos)
	if board.get_cell_source_id(cell) != -1:
		print("Clicked on tile at: ", cell)
		tile_clicked.emit(cell)
