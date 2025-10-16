extends HBoxContainer

@export var RoadBuildButton:Node
@export var WaterBuildButton:Node
@export var PowerBuildButton:Node
@export var ForcitizensBuildButton:Node
@export var ConstructionBuildButton:Node
@export var ResidentialBuildButton:Node
@export var CultureBuildButton:Node
@export var Game_GUI_Node:NodePath

var IS_OPENED : bool = false

func _ready():
	##connect("pressed", Callable(RoadBuildButton,"_on_pressed"))
	RoadBuildButton.pressed.connect(_on_RoadBuildButton_pressed)
	WaterBuildButton.pressed.connect(_on_WaterBuildButton_pressed)
	PowerBuildButton.pressed.connect(_on_PowerBuildButton_pressed)
	ForcitizensBuildButton.pressed.connect(_on_ForcitizensBuildButton_pressed)
	ConstructionBuildButton.pressed.connect(_on_ConstructionBuildButton_pressed)
	ResidentialBuildButton.pressed.connect(_on_ResidentialBuildButton_pressed)
	CultureBuildButton.pressed.connect(_on_CultureBuildButton_pressed)

func  _on_RoadBuildButton_pressed():
	var main_menu = get_node(Game_GUI_Node)
	main_menu.show_sub_menu("RoadPanel")  # 调用主菜单节点的 show_sub_menu 方法
func  _on_WaterBuildButton_pressed():
	var main_menu = get_node(Game_GUI_Node)
	main_menu.show_sub_menu("WaterPanel")  # 调用主菜单节点的 show_sub_menu 方法
func  _on_PowerBuildButton_pressed():
	var main_menu = get_node(Game_GUI_Node)
	main_menu.show_sub_menu("PowerPanel")  # 调用主菜单节点的 show_sub_menu 方法
func  _on_ForcitizensBuildButton_pressed():
	var main_menu = get_node(Game_GUI_Node)
	main_menu.show_sub_menu("forcitizensPanel")  # 调用主菜单节点的 show_sub_menu 方法
func  _on_ConstructionBuildButton_pressed():
	var main_menu = get_node(Game_GUI_Node)
	main_menu.show_sub_menu("ConstructionPanel")  # 调用主菜单节点的 show_sub_menu 方法
func  _on_ResidentialBuildButton_pressed():
	var main_menu = get_node(Game_GUI_Node)
	main_menu.show_sub_menu("ResidentialPanel")  # 调用主菜单节点的 show_sub_menu 方法
func  _on_CultureBuildButton_pressed():
	var main_menu = get_node(Game_GUI_Node)
	main_menu.show_sub_menu("CulturePanel")  # 调用主菜单节点的 show_sub_menu 方法
