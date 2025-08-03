extends Node3D

var collectible_scenes = [
	preload("res://scenes/collectibles/collectible.tscn")
]

@onready var shelves = $Shelves.get_children()

func _ready() -> void:
	for shelf in shelves:
		var slots = shelf.get_children()
		for slot in slots:
			var slot_location = slot.get_child(0)
			if randf() < 1:
				var item = collectible_scenes.pick_random()
				var item_instance = item.instantiate()
				slot_location.add_child(item_instance)
				item_instance.transform.origin = Vector3.ZERO
				item_instance.rotate_y(randf_range(0, 2 * PI))
