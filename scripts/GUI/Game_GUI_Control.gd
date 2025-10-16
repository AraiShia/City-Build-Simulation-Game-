extends Button


@export var Game_GUI_Node:NodePath

var IS_OPENED : bool = false
@export var GUI_NODE : Node
var GUI_NODE_NAME : String

func _ready():
	connect("pressed", Callable(self,"_on_pressed"))

func get_top_level_node():
	var current_node = self
	while current_node.get_parent() != null:
		current_node = current_node.get_parent()
	return current_node
func _on_pressed():
	var main_menu = get_node(Game_GUI_Node)
	GUI_NODE_NAME = GUI_NODE.name


##func _on_pressed():
	
	##if ! IS_OPENED :
		# 获取主菜单节点
	   ## main_menu.show_sub_menu("GUI_NODE_NAME")  # 调用主菜单节点的 show_sub_menu 方法
	  ##  IS_OPENED = true
	##else :
		##main_menu.hide_sub_menu()
	  ##  IS_OPENED = false
