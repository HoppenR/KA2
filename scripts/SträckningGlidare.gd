extends HSlider


func _ready():
	pass

func _process(delta):
	$Text.text = "x: %.1fm" % value
