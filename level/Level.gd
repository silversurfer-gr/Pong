extends Node2D


# Declare member variables here. Examples:
export (String, FILE, "*.tscn") var target_level



# Called when the node enters the scene tree for the first time.
func _ready():
	GameData.bricks_count = $Bricks.get_child_count()
	if GameData.level > 1:
		$Ball.set_position(GameData.ball_position)
		$Ball.set_linear_velocity(GameData.ball_velocity)
	print(GameData.bricks_count)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		
	$Score.text = "Punkte: " + str(GameData.score)
	# Levelwechsel in Abhängigkeit vom Punktestand
	# nicht die beste Methode aber gut für Testzwecke
	# könnte auch in Abhängigkeit vom Gamecount passieren
	if GameData.level == 1  and GameData.score == 30:
		save_GameData()
		get_tree().change_scene(target_level)
	elif GameData.level == 2  and GameData.score == 60:
		save_GameData()
		get_tree().change_scene(target_level)
	else: # wir sind in Level 3
		pass

# erhöht die Levelnummer und speicert Position und Geschwindigkeitsvektor des Balls
func save_GameData():
	GameData.level += 1
	GameData.ball_position = $Ball.get_position()
	GameData.ball_velocity = $Ball.get_linear_velocity()
	
	
func brick_falls():
	pass
	
	
	
