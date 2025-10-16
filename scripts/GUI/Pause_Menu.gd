extends CanvasLayer

@export var ResumeButton:Button
@export var QuitButton:Button
@export var BackButton:Button
@export var PausePanel:Node
@export var rootNode:Node
var _Scene_Path = "res://Scene/Enter_Menu.res"
func _ready():
	ResumeButton.pressed.connect(_on_ResumeButton_pressed)
	BackButton.pressed.connect(_on_BackButton_pressed)
	QuitButton.pressed.connect(_on_QuitButton_pressed)

func _on_ResumeButton_pressed():
	hide()
	get_tree().paused = false  # 恢复游戏
func _on_BackButton_pressed():
	pass
func _on_QuitButton_pressed():
	get_tree().quit()  # 退出游戏
