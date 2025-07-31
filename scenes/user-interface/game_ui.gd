extends CanvasLayer

@onready var score_amount_label : Label = $Score/VBoxContainer/ScoreAmount

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Globals.connect("stat_change", update_stats)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func update_stats():
	score_amount_label.text = str(20)
