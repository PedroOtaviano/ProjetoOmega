extends Area2D

var travelled_distance = 0
@onready var animations = %AnimationPlayer

func _physics_process(delta):
	const SPEED = 400
	const RANGE = 1500
	
	var direction = Vector2.UP
	position += direction * SPEED * delta
	travelled_distance += SPEED * delta
	animations.play("bullet_animation")
	if travelled_distance > RANGE:
		queue_free()

func _on_body_entered(body):
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage()
