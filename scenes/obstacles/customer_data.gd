extends Resource

class_name Customer_Data

@export var bodyColors : PackedColorArray = [Color("#df7300"), Color("#1d7a1f"), Color("#9a4596"), Color("#bb214b"), Color("#4f85c2"), Color("#e6ca21")]
@export var headColors : PackedColorArray = [Color("#473428"), Color("#664D48"), Color("#96634E"), Color("#C78D75"), Color("#D6AA8D"), Color("#D8BBA9")]

@export var headColor:Color
@export var bodyColor:Color


func get_head_color() -> Color:
	headColor = headColors[randi() % headColors.size()]
	return headColor

func get_body_color() -> Color:
	bodyColor = bodyColors[randi() % bodyColors.size()]
	return bodyColor
