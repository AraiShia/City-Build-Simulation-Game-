extends Node
@export var SpeedButtonNormal:Node
@export var SpeedButtonFast:Node
@export var SpeedFastest_Button:Node
@export var PasueButton:Node



var game_speed = 1.0  # 游戏速度，默认为1.0（正常速度）

func _ready():
	SpeedButtonNormal.pressed.connect(_on_SpeedButton_Normal_pressed)
	SpeedButtonFast.pressed.connect(_on_SpeedButton_Fast_pressed)
	SpeedFastest_Button.pressed.connect(_on_SpeedButton_Fastest_pressed)
	PasueButton.pressed.connect(_on_SpeedButton_Pause_pressed)

func _on_SpeedButton_Normal_pressed():
	game_speed = 1  # 每次点击按钮，游戏速度翻倍
	Engine.time_scale = game_speed  # 更新游戏时间尺度
	print_debug("speed1")
func _on_SpeedButton_Fast_pressed():
	game_speed = 2  # 每次点击按钮，游戏速度翻倍
	Engine.time_scale = game_speed  # 更新游戏时间尺度
	print_debug("speed2")
func _on_SpeedButton_Fastest_pressed():
	game_speed = 4  # 每次点击按钮，游戏速度翻倍
	Engine.time_scale = game_speed  # 更新游戏时间尺度
	print_debug("speed4")
func _on_SpeedButton_Pause_pressed():
	game_speed = 0  # 每次点击按钮，游戏速度翻倍
	Engine.time_scale = game_speed  # 更新游戏时间尺度
	print_debug("speed0")
	
