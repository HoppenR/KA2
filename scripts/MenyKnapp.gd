extends Button


func _ready():
	pass

func _on_MenyKnapp_pressed():
	get_tree().change_scene("res://scenes/Meny.tscn")
