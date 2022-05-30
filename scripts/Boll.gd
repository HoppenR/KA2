extends KinematicBody


const g = 9.80665
const pi = 3.14159265358979323846
var velocity = Vector3(0, 0, 0)

func fire(grader, magnitud):
	# Fₓₓₓ_x = F * cos(vinkel)
	# F_y = F * sin(vinkel)
	var radianer = deg2rad(grader)
	var x = cos(radianer) * magnitud
	var y = sin(radianer) * magnitud
	velocity += Vector3(x, y, 0)

func _physics_process(delta):
	if transform.origin.y < 2:
		velocity = Vector3(0, 0, 0)
		return
	# Gravitation
	# g = 9,80665m/s² 
	# v_y = v_y0 + g*t
	# Luftmotstånd
	# a_x = -(k * v) / m * v_x
	# a_y = -g - (k * v) / m * v_y
	# k = ½CρA
	# C för sfär = 0,47
	# ρ = 1,20 kg/m3
	# A = πr² = 0.5² * 3,1415927 m²
	if $"Knappar/LuftmotståndBock".pressed:
		var k = 0.5 * 0.47 * 1.2 * pow(0.5, 2) * pi
		var v = sqrt(pow(velocity.x, 2) + pow(velocity.y, 2))
		var m = $"Knappar/ViktGlidare".value
		var a_x = -(k * v) / m * velocity.x
		var a_y = -g - (k * v) / m * velocity.y
		velocity.x += a_x * delta
		velocity.y += a_y * delta
	else:
		var a_y = -g
		velocity.y += a_y * delta
	translation += velocity * delta
	$"Knappar/Position".text = "Position: %.2fm" % translation.x


func _on_KastaKnapp_pressed():
	# Återställ position till (0, 2, 0)
	translation = Vector3(0, 2, 0)
	# Återställ hastighet till (0, 0, 0)
	velocity = Vector3(0, 0, 0)
	# Kasta med värden på Vinkel- och Hastighetsglidare
	fire($"Knappar/VinkelGlidare".value, $"Knappar/HastighetGlidare".value)
	# Kastlängd = v_0² * sin(2α) / g
	var l = \
		pow($Knappar/HastighetGlidare.value, 2)* \
		sin(2*deg2rad($Knappar/VinkelGlidare.value)) / g
	if $"Knappar/LuftmotståndBock".pressed:
		$"Knappar/Längd".text = ""
	else:
		$"Knappar/Längd".text = "Längd: %.2fm" % l
