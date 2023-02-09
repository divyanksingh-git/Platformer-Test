extends CharacterBody2D


var speed = 200

func  _physics_process(delta):
	velocity = velocity.normalized()*speed
	var col = move_and_collide(velocity*delta)
	if col != null:
		queue_free()


func _on_area_2d_area_entered(area):
	area.queue_free()
