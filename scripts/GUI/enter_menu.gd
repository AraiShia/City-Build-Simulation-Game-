extends Control

@export var StartgameButton:Button
@export var EndGameButton:Button
var ScenePath = "res://Scene/test.tscn"


func _ready() -> void:
	StartgameButton.pressed.connect(_on_Start_Game_Button_Click)
func _load_scene(scenepath):
	var scene = load(scenepath)
	if scene:
# 实例化场景
		var instance = scene.instantiate()
		# 获取当前场景的根节点
		var root = get_tree().current_scene
		# 从场景树中移除当前场景
		if root:
			root.queue_free()
# 将新场景添加到场景树的根节点
		get_tree().root.add_child(instance)
func _on_Start_Game_Button_Click():
	_load_scene(ScenePath)
