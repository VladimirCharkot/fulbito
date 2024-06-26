extends Area2D

class_name Pelota

var girando = false
var vel = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#rotation = 5
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print(position)
	if girando:
		rotation += vel.length() / 10
		
	position += vel
	vel *= 0.998
	
	if vel.length() < 0.1:
		vel = Vector2.ZERO
