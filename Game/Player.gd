extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var velocity = Vector2()
var walk_left = false
var walk_right = false
var walk_up = false
var walk_down = false
var walking = true
var current_frame
func _ready():
	$AnimationPlayer.play("Down_Idle")
func read_input():
	velocity = Vector2()
	if Input.is_action_pressed("up"):
		velocity.y -= 1
		walk_down = false
		walk_left = false
		walk_right= false
		walk_up = true
		walking = true
		$AnimationPlayer.play("Walk_Up")
	elif Input.is_action_pressed("down"):
		velocity.y += 1
		walk_up = false
		walk_left = false
		walk_right= false
		walk_down = true
		walking = true
		$AnimationPlayer.play("Walk_Down")
	elif Input.is_action_pressed("left"):
		velocity.x -= 1
		walk_up = false
		walk_down = false
		walk_right= false
		walk_left = true
		walking = true
		$AnimationPlayer.play("Walk_Left")
	elif Input.is_action_pressed("right"):
		velocity.x += 1
		walk_up = false
		walk_left = false
		walk_down = false
		walk_right = true
		walking = true
		$AnimationPlayer.play("Walk_Right")
	else:
		walking = false
	
	
	velocity.normalized()
	velocity = move_and_slide(velocity * 200)
	
func _idle():
	if walking == false:
		if walk_down == true:
			$AnimationPlayer.play("Down_Idle")
		elif walk_left == true:
			$AnimationPlayer.play("Left_Idle")
		elif walk_right == true:
			$AnimationPlayer.play("Right_Idle")
		elif walk_up == true:
			$AnimationPlayer.play("Up_Idle")
			
func _physics_process(_delta):
	read_input()
	_idle()
