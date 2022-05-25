extends HSlider


func _ready():
	pass

func _process(delta):
	$Text.text = "m: %.1fkg" % value
