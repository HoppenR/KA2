extends CheckBox


func _ready():
	pass

func _process(delta):
	var luftmots = get_node("../ViktGlidare")
	if pressed:
		luftmots.visible = true
	else:
		luftmots.visible = false
