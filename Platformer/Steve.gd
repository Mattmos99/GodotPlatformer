extends KinematicBody2D

var velocity = Vector2(0,0)
const speed = 180
const gravity = 35
const jumpforce = -1100

func _physics_process(delta):
	
	if Input.is_action_pressed("right"):
		velocity.x = speed
		$Sprite.play("walk")
		$Sprite.flip_h = false
	elif Input.is_action_pressed("left"):
		velocity.x = -speed
		$Sprite.play("walk")
		$Sprite.flip_h = true
	else :
		$Sprite.play("idle")
	
	if not is_on_floor():
		$Sprite.play("air")
	
	velocity.y = velocity.y + gravity
	
	if Input.is_action_just_pressed("jump") and is_on_floor() :
		velocity.y = jumpforce
		
	velocity = move_and_slide(velocity,Vector2.UP)
	
	velocity.x = lerp(velocity.x,0,0.2)
	
	
	