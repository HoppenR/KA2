extends CheckBox


func _ready():
	pass

func _process(delta):
	var viktGlidare = get_node("../ViktGlidare")
	if pressed:
		viktGlidare.visible = true
	else:
		viktGlidare.visible = false
