extends HSlider


func _ready():
	pass

func _process(delta):
	$Text.text = "Vinkel: %.1f°" % value
