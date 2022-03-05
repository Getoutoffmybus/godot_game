extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var velocity = Vector2()


func read_input():
	velocity = Vector2()

	velocity.y += int(Input.is_action_pressed("down"))-int(Input.is_action_pressed("up"))
	velocity.x += int(Input.is_action_pressed("right"))-int(Input.is_action_pressed("left"))
	
	velocity.normalized()
	velocity = move_and_slide(velocity * 200)

func _physics_process(_delta):
	read_input()
