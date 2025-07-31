extends CanvasLayer

@onready var score_amount_label : Label = $ScoreUI/VBoxContainer/ScoreAmount
@onready var timer_label : Label = $TimerUI/VBoxContainer/TimeAmount

@onready var countdown_timer : Timer = $Countdown


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Globals.connect("stat_change", update_stats)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	update_timer()



func update_stats():
	score_amount_label.text = str(Globals.score)

func update_timer():
	var time_left = countdown_timer.time_left
	if time_left > 0:
		var minute = floor(time_left / 60)
		var second = int(time_left) % 60
		timer_label.text = "%02d:%02d" % [minute, second]


func _on_countdown_timeout() -> void:
	#trigger game over
	print("Timer ran out! Game over")
