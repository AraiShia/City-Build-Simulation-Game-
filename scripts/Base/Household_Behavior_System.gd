extends Node

var Population :int
var PopMood :float

func _ready() -> void:
	PopMood=50

func AddPopulation():
	Population+=10
func popMoodControl():
	PopMood+=5
