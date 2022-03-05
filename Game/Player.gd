extends KinematicBody2D

var velocity = Vector2()


onready var instancedObject = preload("res://ball.tscn")

func read_input():
	velocity = Vector2()

	velocity.y += int(Input.is_action_pressed("down"))-int(Input.is_action_pressed("up"))
	velocity.x += int(Input.is_action_pressed("right"))-int(Input.is_action_pressed("left"))
	
	velocity.normalized()
	velocity = move_and_slide(velocity * 200)
	
	if Input.is_action_just_released("space"):
		var object = instancedObject.instance()
		object.transform.origin = transform.origin
		get_owner().add_child(object)

func _physics_process(_delta):
	read_input()
