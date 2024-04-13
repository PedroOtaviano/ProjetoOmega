extends Node2D
var speed:int = 150
var direction := Vector2(0,0)
var velocity = 0.0
@onready var animations = $AnimationPlayer

func _ready():
	pass 
		
func _process(delta) -> void:
	
	direction = Input.get_vector("move_left","move_right","move_up","move_down")
	velocity = direction * speed * delta
	position += velocity
	
	if direction.x < 0:
		animations.play("turnleft")
	elif direction.x > 0:
		animations.play("turnright")
	else: 
		animations.play("turnidle")
		 
		
	
	
	
	
	
	

	
	
	
