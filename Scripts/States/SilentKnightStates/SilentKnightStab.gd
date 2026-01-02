extends SilentKnight_States

class_name SilentKnightStab


func Enter():
	attackAnimations("stab_animation")

func Update(delta : float):
	pass

func PhysicsUpdate(delta : float):
	# checking if player exists
	if player:
		pass
	else: # player does not exist
		
		
		
	attackStates()
	moveStates()
