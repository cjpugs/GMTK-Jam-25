extends Node3D

@onready var shelves := $Shelves.get_children()
const ITEM_PATH := "res://scenes/collectibles/collectible.tscn"

func _ready() -> void:
	for shelf in shelves:
		for slot in shelf.get_children():
			#if randf() < 1: #only place collectible certain % of the time
			var location = slot.get_child(0) #get position to place collectible at
			var item_instance = load(ITEM_PATH).instantiate()
			item_instance.global_transform = slot.global_transform
			item_instance.position.y = location.global_transform.origin.y
			item_instance.rotate_y(randf_range(0, 2 * PI))
			location.add_child(item_instance)

			# Reset transform so nothing gets inherited
			item_instance.transform = Transform3D.IDENTITY

			# Apply only a vertical offset
			item_instance.translate(Vector3(0, location.global_transform.origin.y / location.get_parent().global_transform.basis.get_scale().y / 2, 0))
