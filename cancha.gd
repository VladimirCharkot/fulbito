extends Node2D
signal Salio
var gol = 0
var gol_riv = 0 #por si las dudas
# Called when the node enters the scene tree for the first time.
func _ready():
	$Arquero.area = $AreaIzq


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_arco_izq_area_entered(area):
	print("Gol")
	gol += 1
	$Area2D/Label.text = str(gol_riv)  + '-'  + str(gol) # Replace with function body.


func _on_fuera_area_entered(area):

	$Pelota.vel = Vector2(0,0)
	
