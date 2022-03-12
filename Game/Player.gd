extends KinematicBody2D

var velocity = Vector2()
var walking = true
var current_frame
var direction = 0
var speed_factor = 125

func _ready():
	$AnimationPlayer.play("Down_Idle")

func read_input():
	velocity = Vector2()
	
	walking = false
	direction = 0

	_veryMathCalcWalk()
	velocity.normalized()
	velocity = move_and_slide(velocity * speed_factor)

	#_process_vertical()
	#_process_horizontal()
#	velocity.normalized()
#	velocity = move_and_slide(velocity * 200)

func _physics_process(_delta):
	read_input()
#	_idle()
	
func _veryMathCalcWalk():
	var vertical = int(Input.is_action_pressed("down"))-int(Input.is_action_pressed("up"))
	velocity.y += vertical
	
	var horizontal = int(Input.is_action_pressed("right"))-int(Input.is_action_pressed("left"))
	velocity.x += horizontal
	
	direction ^= (vertical << 0)
	direction ^= (horizontal - 2 << 1)

	match direction:
		-6: 
			walking = true
			$AnimationPlayer.play("Walk_Left")
			speed_factor = 150
			return;
		-5: 
			walking = true
			$AnimationPlayer.play("Walk_Down")
			speed_factor = 100
			return;
		-3: 
			walking = true
			$AnimationPlayer.play("Walk_Down")
			speed_factor = 150
			return;
		-2: 
			walking = true
			$AnimationPlayer.play("Walk_Right")
			speed_factor = 150
			return;
		-1: 
			walking = true
			$AnimationPlayer.play("Walk_Down")
			speed_factor = 100
			return;
		1: 
			walking = true
			$AnimationPlayer.play("Walk_Up")
			speed_factor = 100
			return;
		3: 
			walking = true
			$AnimationPlayer.play("Walk_Up")
			speed_factor = 150
			return;
		5: 
			walking = true
			$AnimationPlayer.play("Walk_Up")
			speed_factor = 100
			return;
			
	match $AnimationPlayer.current_animation:
		'Walk_Up':		$AnimationPlayer.play("Up_Idle")
		'Walk_Down':	$AnimationPlayer.play("Down_Idle")
		'Walk_Left':	$AnimationPlayer.play("Left_Idle")
		'Walk_Right':	$AnimationPlayer.play("Right_Idle")

#func _process_vertical() -> void:
#	var vertical = int(Input.is_action_pressed("down"))-int(Input.is_action_pressed("up"))
#
#	velocity.y += vertical
#
#	match vertical:
#		-1: 
#			walking = true
#			$AnimationPlayer.play("Walk_Up")
#			return
#		1: 
#			walking = true
#			$AnimationPlayer.play("Walk_Down")
#			return
#
#func _process_horizontal() -> void:
#	var horizontal = int(Input.is_action_pressed("right"))-int(Input.is_action_pressed("left"))
#
#	velocity.x += horizontal
#
#	match horizontal:
#		-1: 
#			walking = true
#			$AnimationPlayer.play("Walk_Left")
#			return
#		1: 
#			walking = true
#			$AnimationPlayer.play("Walk_Right")
#			return
#
#func _idle():
#	if walking == false:
#		match $AnimationPlayer.current_animation:
#			'Walk_Up':		$AnimationPlayer.play("Up_Idle")
#			'Walk_Down':	$AnimationPlayer.play("Down_Idle")
#			'Walk_Left':	$AnimationPlayer.play("Left_Idle")
#			'Walk_Right':	$AnimationPlayer.play("Right_Idle")
