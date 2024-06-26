extends Node2D
signal Salio
var gol = 0
@onready var cam =  $Pelota/Camera2D
@onready var camjug =  $Jugador/Camera2D
var gol_riv = 0 #por si las dudas
# Called when the node enters the scene tree for the first time.
func _ready():
	$Arquero.area = $AreaIzq
	$Arquero.pelotapos = $Pelota

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	if Input.is_action_just_pressed("camara"):
		print(cam.is_current(),camjug)
		
		if cam.is_current():
			camjug.make_current()
		else:
			cam.make_current()

func _on_arco_izq_area_entered(area):
	print("Gol")
	gol += 1
	$Area2D/Label.text = str(gol_riv)  + '-'  + str(gol) # Replace with function body.
	Salio.emit()
	$Pelota.position = Vector2(588, 322)
	$Pelota.girando = false
	$Pelota.vel = Vector2(0,0)


func _on_fuera_area_entered(area):

	$Pelota.vel = Vector2(0,0)
	
 # Replace with function body.
