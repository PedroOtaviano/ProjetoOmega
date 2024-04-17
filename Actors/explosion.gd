extends AnimatedSprite2D

func _ready():
	pass # Replace with function body.


func _on_animation_finished():
	queue_free()
