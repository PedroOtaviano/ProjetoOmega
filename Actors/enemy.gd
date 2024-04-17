extends CharacterBody2D
@onready var animations = $AnimatedSprite2D
@onready var nave = $"../Nave"
const SPEED = 25 

func _physics_process(_delta):
	var direction = global_position.direction_to(nave.global_position)
	velocity = direction * SPEED
	move_and_slide()
	animations.play("enemy_normal")

func take_damage():
	queue_free()
	const EXPLOSION_SCENE = preload("res://Actors/explosion.tscn")
	var new_explosion = EXPLOSION_SCENE.instantiate()
	get_parent().add_child(new_explosion)
	new_explosion.global_position = global_position
