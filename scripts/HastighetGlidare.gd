extends HSlider


func _ready():
	pass

func _process(delta):
	$Text.text = "Hastighet: %.1fm/s" % value
