extends CharacterBody2D

class_name Player

@onready var animated_sprite_2d: AnimationController = $playerAnimations
@onready var timerDash: Timer = $dashTimer

var SPEED = 5000.0


func _end_dash():
	SPEED = 5000.0

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	
	if direction:
		velocity = direction * SPEED * delta
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED * delta)
		velocity.y = move_toward(velocity.y, 0, SPEED * delta)
		
	if velocity != Vector2.ZERO:
		animated_sprite_2d.play_movement_animation(velocity)
	else:
		animated_sprite_2d.play_idle_animation()
		
	if Input.is_action_just_pressed("Dash"):
		timerDash.start()
		SPEED = 10000.0
		get_tree().create_timer(0.5).timeout.connect(_end_dash)
	
	move_and_slide()
