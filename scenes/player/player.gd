extends CharacterBody2D

signal laser(pos, direction)
signal grenade(pos, direction)
var can_laser: bool = true
var can_grenade: bool = true

@export var max_speed: int = 500
var speed: int = max_speed
# Called when the node enters the scene tree for the first time.
func _ready():
	$LaserParticles.emitting = false # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()

	var player_direction = (get_global_mouse_position() - position).normalized()

	if Input.is_action_just_pressed("primary action") and can_laser:
		$LaserParticles.emitting = true
		var laser_markers = $LaserStartPositions.get_children()
		var selected_laser = laser_markers[randi() % laser_markers.size()]
		print("shoot laser")
		laser.emit(selected_laser.global_position, player_direction)
		can_laser = false
		$LaserTimer.start()
		
	if Input.is_action_just_pressed("secondary action") and can_grenade:
		var pos = $LaserStartPositions/Marker2D.global_position
		print("shoot grenade")
		grenade.emit(pos, player_direction)
		can_grenade = false
		$GrenadeTimer.start()
		
	look_at(get_global_mouse_position())



func _on_laser_timer_timeout():
	can_laser = true # Replace with function body.


func _on_grenade_timer_timeout():
	can_grenade = true # Replace with function body.
