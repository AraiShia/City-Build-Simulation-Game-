extends Node
class_name Buildings

@export var tile_map_layer: TileMapLayer
@export var can_bacth_place: bool = false
@export var item_name : StringName
var is_place : bool = false
var used_points:Array[Vector2]:
	get:
		var points : Array[Vector2]
		for cell in tile_map_layer.get_used_cells():
			var point := tile_map_layer.to_global(tile_map_layer.map_to_local(cell))
			points.append(point)
		return points
var neighbors : Array[Buildings]

func add_neighbor_building(Building:Buildings)-> void:
	if Building == self or Building == null :return
	neighbors.append(Building)
func remove_neighbor_building(building:Buildings) -> void:
	if neighbors.has(building):
		neighbors.erase(building)
