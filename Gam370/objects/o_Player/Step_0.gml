//Apply changes to momentum
//Horizontal momentum - use Friction to stop sliding quickly when grounded 
//and AirRez when in the air which should be a must lower value
if HMomentum > 0
{
	if Grounded = true
	{
		HMomentum -= Friction
	}
	else
	{
		HMomentum -= AirRez
	}
	//make sure we are not < 0
	if HMomentum < 0
	{
		HMomentum = 0	
	}
}

//Vertical momentum
if VMomentum > 0
{
	VMomentum -= Gravity
}
//make sure we are not < 0
if VMomentum < 0
{
	VMomentum = 0	
}

//Move object according to momentum values
//Horizontal momentum
