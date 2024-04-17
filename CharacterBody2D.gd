extends Node2D
var speed:int = 300
var direction := Vector2(0,0)
var velocity = 0.0
var health := 10
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
	atirar()

func shoot():
	const BULLET = preload("res://Actors/bullet.tscn")
	var new_bullet = BULLET.instantiate()
	owner.add_child(new_bullet)
	new_bullet.position = %Marker2D.global_position
	
func atirar():
	if Input.is_action_just_pressed("action"):
		shoot()
		
func player_take_damage():
	pass
