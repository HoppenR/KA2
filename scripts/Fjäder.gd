extends KinematicBody


const g = 9.80665
const pi = 3.14159265358979323846
onready var v = 0
onready var a = 0
onready var k = 25
onready var m = 1
onready var equilibrium = $"MeshInstance".get_aabb().size.y
onready var x = equilibrium
var started = false

func _ready():
	pass

func _process(delta):
	$"Knappar/PeriodtidText".text = "Periodtid: %.2fs" % (2 * pi * sqrt(m / k))

func start(k_in, x_in, m_in):
	a = 0
	v = 0
	k = k_in
	x = equilibrium + x_in
	m = m_in
	started = true

func _physics_process(delta):
	if started:
		var F = -k * (x-equilibrium) + g * m
		a = F / m
		v += a * delta
		x += v * delta
	$"MeshInstance".scale.y = x / equilibrium


func _on_SlappKnapp_pressed():
	start($"Knappar/KonstantGlidare".value,
		$"Knappar/SträckningGlidare".value,
		$"Knappar/MassaGlidare".value)
