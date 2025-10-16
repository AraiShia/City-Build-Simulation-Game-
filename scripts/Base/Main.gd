extends Node2D

@export var tile_map_layer: TileMapLayer
var background_music = preload("res://assets/wav/Fiesta_Waves.mp3")
@export var _WORLD_SIZE:Vector2i = Vector2i(128,128)
@export var pause_menu:Node
@export var Control_Panel:Node
var IS_PANEL_SHOWED_CP :bool = false
@export var PauseBG :Button


var _astar := AStarGrid2D.new()
var _world_rect : Rect2i:
	set(value):
		_world_rect = value
		_astar.region = value
		_astar.update()
	
##在节点加载时执行生成游戏世界函数
func _ready() -> void:
	_CREAT_WORLD()
	_astar.diagonal_mode = AStarGrid2D.DIAGONAL_MODE_NEVER
	_astar.default_compute_heuristic = AStarGrid2D.HEURISTIC_MANHATTAN
	_astar.default_estimate_heuristic = AStarGrid2D.HEURISTIC_MANHATTAN
	NormalBuildSystem.tile_map = tile_map_layer
	NormalBuildSystem.astar = _astar
	pause_menu.hide()
	Control_Panel.hide()
	var audio_player = AudioStreamPlayer.new()
	audio_player.stream = background_music
	add_child(audio_player)
	audio_player.play()
##	PauseBG.pressed.connect(_OnPauseBG_Button_Pressed)
	
func _OnPauseBG_Button_Pressed():
	pass
##生成游戏世界
func _CREAT_WORLD() -> void:
	for _LENTH in range(0,_WORLD_SIZE.x):
		for _WIDTH in range(0,_WORLD_SIZE.y):
			var cell := Vector2i(_LENTH,_WIDTH)
			tile_map_layer.set_cell(cell,0,Vector2i(0,0))
	_world_rect = Rect2i(Vector2i.ZERO, _WORLD_SIZE)

func _input(event):
	if event is InputEventKey and event.pressed and event.keycode == KEY_ESCAPE:
		toggle_pause()  # 按下 ESC 键时切换暂停状态
	if event is InputEventKey and event.pressed and event.keycode == KEY_F1:
		toggle_Control_panel()

func toggle_pause():
	if get_tree().paused:
		get_tree().paused = false  # 恢复游戏
		pause_menu.hide()  # 隐藏暂停菜单
	else:
		get_tree().paused = true  # 暂停游戏
		pause_menu.show()  # 显示暂停菜单
func toggle_Control_panel():
	if IS_PANEL_SHOWED_CP == false :
		Control_Panel.show()
		IS_PANEL_SHOWED_CP = true
	else :
		Control_Panel.hide()
		IS_PANEL_SHOWED_CP = false
	
