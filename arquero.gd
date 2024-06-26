extends Jugador
var ultipo = Vector2(0,0)
var area: Area2D = null
var pelotapos = null
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	vel = 4

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if pelotapos:
		
		var v = (pelotapos.position - position).normalized()
		position += v * vel
		if area and not(area.overlaps_area($Control)):
			position = ultipo
			print("a")
		else:
			ultipo = position
			print("b")
		apariencia(v)	
		manejar_pelota(v)
