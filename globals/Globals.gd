extends Node

signal stat_change()

var score : int = 0:
	set(val):
		score = val
		stat_change.emit()

var items_grabbed : int = 0
