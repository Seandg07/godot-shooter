extends RigidBody2D

const speed = 750

func _ready():
	$Explosion.frame = 0


func explode():
	$AnimationPlayer.play("Explosion")
