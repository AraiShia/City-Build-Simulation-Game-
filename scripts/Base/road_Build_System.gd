extends Node
var build_mode = false
var start_position = Vector2.ZERO
var end_position = Vector2.ZERO
@export var build_road_button:Node

func _ready():
	
	build_road_button.pressed.connect(_on_BuildRoadButton_pressed)

func _on_BuildRoadButton_pressed():
	build_mode = true
	$StatusLabel.text = "Road build mode activated. Click to set start point."
##查询鼠标位置控制建造方向与距离
func _input(event):
	if build_mode:
		if event is InputEventMouseButton and event.pressed:
			if event.button_index == MOUSE_BUTTON_LEFT:
				if start_position == Vector2.ZERO:
					start_position = event.position
					$StatusLabel.text = "Start point set. Click to set end point."
				else:
					end_position = event.position
					build_road(start_position, end_position)
					build_mode = false
					start_position = Vector2.ZERO
					end_position = Vector2.ZERO
					$StatusLabel.text = "Road build mode deactivated."
			elif event.button_index == MOUSE_BUTTON_RIGHT:
				build_mode = false
				start_position = Vector2.ZERO
				end_position = Vector2.ZERO
				$StatusLabel.text = "Road build mode cancelled."
##在游戏内建造道路
func build_road(start, end):
	var road_scene = load("res://Road.tscn")
	var road = road_scene.instance()
	road.position = start
	road.rotation = (end - start).angle()
	road.scale = Vector2(1, (end - start).length() / 100)  # 假设道路长度为100单位
	add_child(road)
	print("Road built from", start, "to", end)
