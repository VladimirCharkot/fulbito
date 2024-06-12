extends Jugador

var area: Area2D = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	var v = Vector2(1, 0)
	position += v * vel
	if area and not(area.overlaps_area($Control)):
		position -= v * vel
		
	apariencia(v)
	
	manejar_pelota(v)
