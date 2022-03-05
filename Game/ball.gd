extends KinematicBody2D

var velocity = Vector2()

func read_input():
	velocity = Vector2()

	velocity.y -= 1
	
	velocity.normalized()
	velocity = move_and_slide(velocity * 80)

func _physics_process(_delta):
	read_input()
