extends CanvasLayer

var IS_PANEL_SHOWED :bool = false
@export var GAME_PAUSE_MENU:Panel
##var pause_menu = null


func _ready():
	# 隐藏所有二级菜单
	
	for panel in get_children():
		if panel is Panel:
			panel.hide()

func show_sub_menu(panel_name: String):
	# 隐藏所有二级菜单
	for panel in get_children():
		if panel is Panel :
			panel.hide()
			IS_PANEL_SHOWED = false
	# 显示指定的二级菜单
	var panel = get_node(panel_name)
	if panel:
		panel.show()
		IS_PANEL_SHOWED = true
func hide_sub_menu():
	# 隐藏所有二级菜单
	for panel in get_children():
		if panel is Panel:
			panel.hide()
			IS_PANEL_SHOWED = false
###func _physics_process(delta: float) -> void:
	##if Input.is_action_pressed("ui_cancel") && IS_PANEL_SHOWED :
	##	for panel in get_children():
	##		if panel is Panel:
	##			##panel.hide()
	##			IS_PANEL_SHOWED = false
	##if Input.is_action_pressed("ui_cancel") && !IS_PANEL_SHOWED :
	##	##GAME_PAUSE_MENU.show()
	##	toggle_pause()

##func toggle_pause():
	##if get_tree().paused:
	##	get_tree().paused = false  # 恢复游戏
	##	##pause_menu.hide()  # 隐藏暂停菜单
	##else:
	##	get_tree().paused = true  # 暂停游戏
		##pause_menu.show()  # 显示暂停菜单
