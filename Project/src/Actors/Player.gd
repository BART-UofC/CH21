extends Actor
# some tweaks might be required as the scale of new sprite is different


export var stomp_impulse:  = 1000.0
export var velocity_cutoff = 0.5
export var linear_accel = 0.2
#  velocity cutoff allows us to gradually decrease the vel of interrupted jump

var direction: = Vector2.ZERO
onready var sprite: Sprite = get_node("pain")

func _on_EnemyDetector_area_entered(area: Area2D) -> void:
	
	if (area.name == "StompDetector") && (not is_on_floor()):
		area.get_parent().die()
		_velocity = calculate_stomp_velocity(_velocity, stomp_impulse)
	
func _on_EnemyDetector_body_entered(_body: Node) -> void:
	queue_free()
	get_tree().reload_current_scene()
# warning-ignore:return_value_discarded

# loops every frame
# all looping logic should be placed here
func _physics_process(_delta: float) -> void:
	var is_jump_interrupted: = Input.is_action_just_released("jump") and _velocity.y < 0.0
	direction = get_direction()
	_velocity = calculate_move_velocity(_velocity, direction, speed, is_jump_interrupted)
	_velocity = move_and_slide(_velocity, FLOOR_NORMAL)
	
	# flips sprite based on direction we're moving in
	if direction.x > 0:
		sprite.flip_h = false
	elif direction.x < 0:
		sprite.flip_h = true
		
	
func get_direction() -> Vector2:
		
	return Vector2(
	Input.get_action_strength("move_right") - Input.get_action_strength("move_left"), 
	-Input.get_action_strength("jump") if is_on_floor() and Input.is_action_just_pressed("jump") else 0.0
	)

func calculate_move_velocity(linear_velocity: Vector2,
							direction_in: Vector2,
							speed: Vector2,
							is_jump_interrupted: bool
							) -> Vector2:
								
	var out: = linear_velocity
	out.x = speed.x * direction.x
	out.x *= linear_accel
	out.y += gravity * get_physics_process_delta_time()
	
	if direction_in.y == -1.0:
		out.y = speed.y * direction_in.y
	
	if is_jump_interrupted:
		out.y *= velocity_cutoff
		# player movement was to clucky when this was 0.0
	
	return out

func calculate_stomp_velocity(linear_velocity: Vector2, impulse: float) -> Vector2:
	var out: = linear_velocity
	out.y = -impulse
	return(out)
