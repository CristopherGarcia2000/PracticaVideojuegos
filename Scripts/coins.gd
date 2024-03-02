extends Node2D
@onready var animation = $Coin


func _ready():
	animation.play("Idle")

func _on_area_2d_area_entered(area):
	GameManager.gain_coins(1)
	queue_free()
