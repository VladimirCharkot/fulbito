extends CharacterBody2D

class_name Jugador

@export var fuerza_patada = 1
@export var energia_max = 1000

var vel = 200

var pelota = null
var pateo = 0
var energia = 1000
var moversino = true

func _ready():
	$Sprite.play("quieto")

func _process(delta):
	# Movimiento
	var v = Input.get_vector("a", "d", "w", "s")
	velocity = v * vel
	move_and_slide()
	
	apariencia(v)
	
	manejar_pelota(v)
	
	if Input.is_action_just_pressed("q") and pelota:
		var patada = get_local_mouse_position().normalized()
		pelota.vel = patada * fuerza_patada
		pelota.girando = true
		pelota = null
		energia -= 200
		
	if Input.is_action_pressed("Correr"):
		vel = energia/2.5
		energia -= 1
	else:
		vel = energia/5
		energia += 1
	
	if energia > energia_max:
		energia = energia_max
	
	if vel <= 0:
		vel = 0
		
	if energia <= 0:
		energia = 0

		
	queue_redraw()
	print(vel)

func _draw():
	var p1 = Vector2(-10,-15)
	var p2 = p1 + Vector2(20 * energia / energia_max, 0)
	draw_line(p1, p2, Color.DARK_ORANGE, 4)

func manejar_pelota(v):
	if pelota: 
		
		var d = Vector2.ZERO
		
		if v.length() > 0:
			pelota.girando = true
			if v.x != 0:
				if v.x < 0: 
					d = Vector2(-20, 20)
				if v.x > 0:
					d = Vector2(20, 20)
					
			if v.x == 0:
				if v.y > 0:
					d = Vector2(0, 30)
				if v.y < 0:
					pass
		else:
			pelota.girando = false
			d = Vector2(0, 30)
			
		pelota.position = position + d


func apariencia(v):
	if v.length() > 0:
		if v.x != 0:
			$Sprite.play("lateral")
			if v.x < 0: 
				$Sprite.flip_h = true
				z_index = 0
				modulate = Color.WHITE
			if v.x > 0:
				$Sprite.flip_h = false
				z_index = 0
				modulate = Color.WHITE
				
		if v.x == 0:
			if v.y > 0:
				$Sprite.play("abajo")
				z_index = 0
				modulate = Color.WHITE
			if v.y < 0:
				$Sprite.play("arriba")
				z_index = 1
				modulate = Color(Color.WHITE, 0.7)
		
	else: 
		$Sprite.play("quieto")


func _on_control_area_entered(area):
	if area is Pelota:
		pelota = area

#func _on_timer_timeout():
	#energia = max(energia - 2, 0)	# Idiomática
