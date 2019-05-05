extends Area


var SPEED = 5
var velocity = Vector3()
var bullet_fly = true
var previous_velocity= Vector3()


func shoot(xform):
	transform = xform
	velocity = -transform.basis.z * SPEED
	

func _process(delta):
	if bullet_fly:
		transform.origin += velocity * delta

func _on_Timer_timeout():
	queue_free()


func _on_Bullet_body_entered(body):
	if body is StaticBody:
		bullet_fly = false
		get_node("Particles").show()
		get_node("MeshInstance").hide()
		
		#velocity = -transform.basis.z * 0
		#transform.origin -= previous_velocity
		
		yield(get_tree().create_timer(0.25), "timeout")
		queue_free()
		