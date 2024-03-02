extends CharacterBody2D

var speed = 100.0
@onready var animation = $BanditSprite
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var facingRight = false

func _ready():
	animation.play("Running")

func _physics_process(delta):
	# Add the gravity.
	if  not is_on_floor():
		velocity.y += gravity * delta
	if !$RayCast2D.is_colliding() && is_on_floor():
		flip()
	velocity.x = speed
	move_and_slide()
func flip():
	facingRight = !facingRight
	scale.x = abs(scale.x) * -1
	if facingRight:
		speed = abs(speed)
	else:
		speed = abs(speed) * -1


func _on_hitbox_area_entered(area):
	if area.get_parent() is Player:
		area.get_parent().die()
