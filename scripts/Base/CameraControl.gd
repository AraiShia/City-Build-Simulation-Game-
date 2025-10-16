extends Camera2D


##摄像机缩放

var _is_ZOOM : bool
var _target_ZOOM : float
var ZOOM_INCERMENT : float = 0.1
var MAX_ZOOM : float = 15
var MIN_ZOOM : float = 1
var ZOOM_RATE : float = 1


##摄像机移动
##鼠标拖动摄像机

var _DRAGING_SPEED : float = 100
var _IS_DRAGGING : bool = false
var _NOW_CAMERA_POSITION : Vector2 = Vector2.ZERO
var _PREV_MOUSE_POSITION : Vector2


##主进程
func _physics_process(delta: float) -> void:
	if _is_ZOOM:
		zoom = lerp(zoom,_target_ZOOM*Vector2.ONE,delta*ZOOM_RATE)
		_is_ZOOM = not is_equal_approx(zoom.x,_target_ZOOM)
	if _IS_DRAGGING:
		_NOW_CAMERA_POSITION = _PREV_MOUSE_POSITION-get_local_mouse_position()
##键盘移动摄像机
	if Input.is_action_pressed("ui_up"):
		_NOW_CAMERA_POSITION.y -= _DRAGING_SPEED*delta
	if Input.is_action_pressed("ui_down"):
		_NOW_CAMERA_POSITION.y += _DRAGING_SPEED*delta
	if Input.is_action_pressed("ui_left"):
		_NOW_CAMERA_POSITION.x -= _DRAGING_SPEED*delta
	if Input.is_action_pressed("ui_right"):
		_NOW_CAMERA_POSITION.x += _DRAGING_SPEED*delta

	position += _NOW_CAMERA_POSITION *zoom
	_NOW_CAMERA_POSITION = Vector2.ZERO
	_PREV_MOUSE_POSITION = get_local_mouse_position()
	
	
##Unhandled Input

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			_ZOOM_OUT()
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			_ZOOM_IN()
		elif event.button_index == MOUSE_BUTTON_RIGHT:
			_IS_DRAGGING = true if event.pressed else false
			
func _ZOOM_IN():
	_target_ZOOM = max(MIN_ZOOM,_target_ZOOM-ZOOM_INCERMENT)
	_is_ZOOM = true
func _ZOOM_OUT():
	_target_ZOOM = min(MAX_ZOOM,_target_ZOOM + ZOOM_INCERMENT)
	_is_ZOOM = true
