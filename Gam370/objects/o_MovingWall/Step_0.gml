if PointTravel = false //move to point B
{
	move_towards_point(PointBX,PointBY,TravelSpeed)
	if x = PointBX and y = PointBY
	{
		//we have reached point B, so flip the boolean and travel to the other point
		PointTravel = true
	}
}
else //move to point A
{
	move_towards_point(PointAX,PointAY,TravelSpeed)
	if x = PointAX and y = PointAY
	{
		//we have reached point A, so flip the boolean and travel to the other point
		PointTravel = false
	}	
}

//move linked wall to current position 
ConnectedWallID.x = x
ConnectedWallID.y = y