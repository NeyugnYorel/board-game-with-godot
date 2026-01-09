extends Label


@export var quantity     : int = 0
@export var max_quantity : int = 0

func update_display() -> void:
	text = "{0}/{1}".format([quantity, max_quantity])
	modulate = Color.from_rgba8(25, 215, 105) if (quantity >= max_quantity) else Color.ALICE_BLUE

func set_quantity(new_quantity : int) -> void:
	quantity = new_quantity
	update_display()

func set_max_quantity(new_max_quantity : int) -> void:
	max_quantity = new_max_quantity
	update_display()

func _ready() -> void:
	update_display()

func _on_board_blue_quanity_changed(new_quantity: int) -> void:
	set_quantity(new_quantity)

func _on_board_blue_max_quanity_changed(new_max_quantity: int) -> void:
	set_max_quantity(new_max_quantity)

func _on_board_red_quanity_changed(new_quantity: int) -> void:
	set_quantity(new_quantity)
	
func _on_board_red_max_quanity_changed(new_max_quantity: int) -> void:
	set_max_quantity(new_max_quantity)
