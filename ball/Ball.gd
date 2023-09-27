extends RigidBody2D


# Declare member variables here. Examples:
export var speedup = 4
export var maxspeed = 600


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_position().y > get_viewport_rect().end.y:
		queue_free()
		
	var bodies = get_colliding_bodies()
	
	for body in bodies:
		if body.is_in_group("Bricks"):
			GameData.score += 10
			GameData.bricks_count -= 1
			if GameData.level == 3:
				# body.brick_falls()
				pass
			else:
				body.queue_free()
		if body.get_name() == "Player":
			var speed = get_linear_velocity().length()
			var new_direction = get_position() - body.get_node("Position2D").get_global_position()
			var new_speed = min(int(speed) + speedup, maxspeed)
			#print(new_speed)
			var new_velocity = new_direction.normalized() * new_speed
			set_linear_velocity(new_velocity)
			
			
			
			
			
			
			
