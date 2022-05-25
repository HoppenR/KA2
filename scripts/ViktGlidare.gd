extends HSlider


func _ready():
	pass

func _process(delta):
	$Text.text = "Vikt: %dg" % value
