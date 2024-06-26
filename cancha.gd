extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$Arquero.area = $AreaIzq
	$Arquero.pelotapos = $Pelota
	$Arquero.arco = $ArcoIzq


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
