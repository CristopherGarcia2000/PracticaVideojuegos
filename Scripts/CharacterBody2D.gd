extends CharacterBody2D
class_name Player
var SPEED = 200.0
const JUMP_VELOCITY = -400.0


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var animation = $Idle
@onready var collision = $CollisionShape2D
var isCrouching = false
var idleCollision = preload("res://Resources/KnightStanding.tres")
var crouchCollision = preload("res://Resources/KnightCrouch.tres")

func _ready():
	GameManager.player = self

func _physics_process(delta):
	
	# Add the gravity.
	if  not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("Saltar") and is_on_floor():
		$JumpSound.play()
		velocity.y = JUMP_VELOCITY
		

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("Izquierda", "Derecha")
	velocity.x = SPEED * direction
	if direction != 0:
		switchDirection(direction)
	if Input.is_action_just_pressed("Crouch"):
		crouch()
	elif Input.is_action_just_released("Crouch"):
		stand()
		
	move_and_slide()
	
	updateAnimations(direction)
	
func updateAnimations(direction):
	if is_on_floor():
		if direction == 0:
			if isCrouching:
				animation.play("Crouching")
			else:
				animation.play("Idle")
		else:
			if isCrouching:
				SPEED = 50
				animation.play("CrouchingMove")
			else:
				SPEED = 200
				animation.play("Running")
	else:
		if velocity.y < 0:
			animation.play("Jumping")
		elif velocity.y > 0:
			animation.play("Falling")
		
	

func switchDirection(direction):
	animation.flip_h = (direction == -1)
	animation.position.x = direction * 4
	
func crouch():
	if isCrouching:
		return
	isCrouching = true
	collision.shape = crouchCollision
	collision.position.y = -12
func stand():
	if isCrouching == false:
		return
	isCrouching = false
	collision.shape = idleCollision
	collision.position.y = -18.75
func die():
	$DieSound.play()
	GameManager.respawn_player()
