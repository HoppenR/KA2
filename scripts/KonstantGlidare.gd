extends HSlider


func _ready():
	pass

func _process(delta):
	$Text.text = "k: %.1f N/m" % value
