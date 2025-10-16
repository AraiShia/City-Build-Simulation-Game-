extends Node
# 简化建筑系统 - 处理7种建筑类型的放置

var tile_map: TileMapLayer
var astar : AStarGrid2D
var _road_build_preview_start_point: Vector2
var _is_preview_road:bool = false
var _is_road_button_down:bool =false
var _buildings_preview:Array[Buildings]
func _process(delta: float) -> void:
	if _buildings_preview.is_empty():return
	if _buildings_preview.size()<=1:
		var buildings :=_buildings_preview[0]
		buildings.position = get_map_pos(tile_map.get_local_mouse_position())
	if _is_preview_road:
		var path :=astar.get_point_path(
			tile_map.local_to_map(_road_build_preview_start_point),
			tile_map.local_to_map(tile_map.get_local_mouse_position()))
		var index := 0
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if not _buildings_preview.is_empty():
				for building in _buildings_preview:
					place_building(building)
		if event.button_index == MOUSE_BUTTON_MASK_RIGHT:
			if event.is_pressed():
				cancle_preview()
# 为每种建筑类型创建单独的导出变量
func preview_building(building_scene : PackedScene):
	if not _buildings_preview.is_empty():
		for building:Buildings in _buildings_preview:
			building.get_parent().remove_child(building)
			building.queue_free()
		_buildings_preview.clear()
	var _building_preview :Buildings= _create_building(building_scene)
	_buildings_preview.append(_building_preview)

func _create_building(building_scene:PackedScene)->Buildings:
	var _building = building_scene.instantiate()
	_building.set_meta("scene",building_scene)
	tile_map.add_child(_building)
	return _building
func _destory_building(building:Buildings)->void:
	building.get_parent().remove_child(building)
	building.queue_free()
# 信号 - 建筑类型已选择
func cancle_preview():
	if _buildings_preview.is_empty():return
	for buildings:Buildings in _buildings_preview:
		_destory_building(buildings)
	_buildings_preview.clear()
func place_building(building : Buildings) -> void:
	if _buildings_preview.is_empty():return
	_buildings_preview.clear()
	builded(building)
func get_map_pos(pos : Vector2)->Vector2:
	var point : Vector2 = 	tile_map.map_to_local(tile_map.local_to_map(pos))
	return point
func builded(building :Buildings):
	
	if building.item_name == "WaterTower":
		ResourceBuyerSystem.WaterResource+=10
		EconomySystem.tax+=40
		EconomySystem.balance-=10000
	elif building.item_name == "Power_Plant":
		ResourceBuyerSystem.PowerResource+=20
		EconomySystem.outcome-=30
		EconomySystem.balance-=10000
	elif building.item_name == "Culture":
		HouseholdBehaviorSystem.popMoodControl()
		EconomySystem.outcome-=10
		ResourceBuyerSystem.PowerResource-=4
		EconomySystem.balance-=10000
	elif building.item_name == "Residential":
		HouseholdBehaviorSystem.AddPopulation()
		EconomySystem.tax+=10
		ResourceBuyerSystem.PowerResource-=4
		ResourceBuyerSystem.WaterResource-=4
		ResourceBuyerSystem.FoodResource-=5
		EconomySystem.balance-=10000
	elif building.item_name =="Farm":
		ResourceBuyerSystem.FoodResource+=20
		EconomySystem.outcome+=60
		EconomySystem.balance-=10000
	elif building.item_name == "Construction":
		EconomySystem.balance-=10000
