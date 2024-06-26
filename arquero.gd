extends Jugador

var area: Area2D = null
var arco: Area2D = null
var pelotapos: Node2D = null

var v = Vector2.ZERO
var punto_deseado = Vector2.ZERO

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	var arco_pelota = arco.position.direction_to(pelotapos.position)
	punto_deseado = arco.position + arco_pelota * 100
	v = position.direction_to(punto_deseado)
	
	if position.distance_to(punto_deseado) > 2:
		velocity = v * vel
	else:
		velocity = Vector2.ZERO
		
	move_and_slide()

	apariencia(v)
	
	manejar_pelota(v)
	
	queue_redraw()

func _draw():
	draw_circle(punto_deseado, 5, Color.BROWN)
	draw_line(Vector2.ZERO, velocity, Color.DARK_BLUE, 3)
