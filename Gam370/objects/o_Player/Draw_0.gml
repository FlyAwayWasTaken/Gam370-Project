//if we are pulling back, draw a line showing where we are going to go
if PullingBack = true
{
	//get distance and angle for calculations
	var MouseDistance = distance_to_object(o_Mouse)
	var MouseDirection = point_direction(x,y,o_Mouse.x,o_Mouse.y)
	
	//draw an arrow out of the object going the opposite way (now old debug code)
	//draw_arrow(x,y,x + lengthdir_x(MouseDistance * 1.5, MouseDirection + 180),y + lengthdir_y(MouseDistance * 1.5, MouseDirection + 180),5)	
	
	//get current projected momentum values
	var ProjectedMomentumV = (o_Mouse.y - y) / 10
	var ProjectedMomentumH = (x - o_Mouse.x) / 10
	
	var ProjectedSignV = sign(ProjectedMomentumV)
	var ProjectedSignH = sign(ProjectedMomentumH)
	
	//make sure they are not greater than the max
	//Vertical Momentum
	if ProjectedMomentumV > 10
	{
		ProjectedMomentumV = 10
	}
	//Horizontal Momentum
	if ProjectedMomentumH > 10
	{
		ProjectedMomentumH = 10
	}	
	
	//get x and y position
	var ProjectedPosX = x
	var ProjectedPosY = y
	
	//get player sprite height and width
	var PlayerHeight = sprite_get_height(sprite_index)
	var PlayerWidth = sprite_get_width(sprite_index)

	//predict where the player will go and project that
	for(var i = 0 ; i < 30; i++) //we want to simulate 30 dots
	{	
		for(var j = 0; j < 3; j++) //and we want to simulate them 3 frames apart
		{
			//Gravity physics
			ProjectedMomentumV += Grav
			
			ProjectedSignV = sign(ProjectedMomentumV)
			ProjectedSignH = sign(ProjectedMomentumH)
			
			//Get ABS values
			var ProjectedMomentumVABS = abs(ProjectedMomentumV)
			var ProjectedMomentumHABS = abs(ProjectedMomentumH)
			
			//Vertical Momentum
			
			
			//going up 
			if ProjectedSignV > 0
			{
				
				for (var l = 0; l < ProjectedMomentumVABS; l++) 
				{
					if instance_position(ProjectedPosX,ProjectedPosY - (PlayerHeight / 2) ,o_Wall)
					{
						//we've hit a wall! kill momentum and end this loop
						l = ProjectedMomentumVABS
						ProjectedMomentumV = 0
					}
					else
					{
						//commit movement
						ProjectedPosY -= 1
					}
				}	
			}
			
			//going down 
			if ProjectedSignV < 0
			{
				
				for (var l = 0; l < ProjectedMomentumVABS; l++) 
				{
					if instance_position(ProjectedPosX,ProjectedPosY + (PlayerHeight / 2) ,o_Wall)
					{
						//we've hit a wall! kill momentum and end this loop
						l = ProjectedMomentumVABS
						ProjectedMomentumV = 0
					}
					else
					{
						//commit movement
						ProjectedPosY += 1
					}
				}					
			}
			
			//Horizontal Momentum
			
			//Going Left 
			if ProjectedSignH < 0
			{
				for (var l = 0; l < ProjectedMomentumHABS; l++) 
				{
					if instance_position(ProjectedPosX - (PlayerWidth / 2) - 1,ProjectedPosY,o_Wall)
					{
						//we've hit a wall! bounce back the other way!
						ProjectedMomentumH = ProjectedMomentumH * 0.3
						ProjectedMomentumH = ProjectedMomentumH * -1
						l = ProjectedMomentumHABS
						i = 30
					}
					else
					{
						//commit movement
						ProjectedPosX -= 1
					}		
				}
			}

			//Going Right
			if ProjectedSignH > 0
			{
				for (var l = 0; l < ProjectedMomentumHABS; l++) 
				{
					if instance_position(ProjectedPosX + (PlayerWidth / 2),ProjectedPosY ,o_Wall)
					{
						//we've hit a wall! bounce back the other way!
						ProjectedMomentumH = ProjectedMomentumH * 0.3
						ProjectedMomentumH = ProjectedMomentumH * -1
						l = ProjectedMomentumHABS
						i = 30
					}
					else
					{
						//commit movement
						ProjectedPosX += 1
					}
				}
			}	
			
		}
			//if we have no vmomentum and are touching the ground then kill the simulation
			if ProjectedMomentumV = 0 and instance_position(ProjectedPosX,ProjectedPosY + (PlayerHeight / 2),o_Wall)
			{
				i = 30	
			}
			else
			{			
				//now draw a dot at the location
				draw_circle(ProjectedPosX,ProjectedPosY,1,false)
			}
	}
}

draw_self()