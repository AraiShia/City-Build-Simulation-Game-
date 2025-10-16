extends Control

# 建筑界面控制器 - 管理建筑选择面板
@export var water_tower_button: Button
@export var power_plant_button: Button
@export var farm_button: Button
@export var construction_button: Button
@export var residential_button: Button
@export var culture_button: Button
@export var road_straight_button: Button
@export var road_Cross_button: Button
@export var road_Vertical_button: Button
@export var Population:RichTextLabel

# 按钮颜色
@export var water_tower_scene: PackedScene
@export var power_plant_scene: PackedScene
@export var farm_scene: PackedScene
@export var construction_scene: PackedScene
@export var residential_scene: PackedScene
@export var culture_scene: PackedScene
@export var road_scene: PackedScene
@export var road_cross_scene: PackedScene
@export var road_Vertical_scene: PackedScene

func _ready() -> void:
	water_tower_button.pressed.connect(_on_Water_Tower_Button_click)
	power_plant_button.pressed.connect(_on_Power_Plant_Button_click)
	farm_button.pressed.connect(_on_Farm_Button_click)
	construction_button.pressed.connect(_on_Construction_click)
	residential_button.pressed.connect(_on_Residential_click)
	culture_button.pressed.connect(_on_Culture_Button_click)
	road_straight_button.pressed.connect(_on_Road_Button_click)
	road_Cross_button.pressed.connect(_on_Road_Cross_Button_click)
	road_Vertical_button.pressed.connect(_on_Road_Vertical_Button_click)
func _on_Water_Tower_Button_click():
	NormalBuildSystem.preview_building(water_tower_scene)
func _on_Power_Plant_Button_click():
	NormalBuildSystem.preview_building(power_plant_scene)
func _on_Farm_Button_click():
	NormalBuildSystem.preview_building(farm_scene)
func _on_Construction_click():
	NormalBuildSystem.preview_building(construction_scene)
func _on_Residential_click():
	NormalBuildSystem.preview_building(residential_scene)
func _on_Culture_Button_click():
	NormalBuildSystem.preview_building(culture_scene)
func _on_Road_Button_click():
	NormalBuildSystem.preview_building(road_scene)
func _on_Road_Cross_Button_click():
	NormalBuildSystem.preview_building(road_cross_scene)
func _on_Road_Vertical_Button_click():
	NormalBuildSystem.preview_building(road_Vertical_scene)
func _process(delta: float) -> void:
	Population.text="人口:"+str(HouseholdBehaviorSystem.Population)
