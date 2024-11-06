//if we are pulling back, draw a line between the mouse and the player
if PullingBack = true
{
	//get distance and angle for calculations
	var MouseDistance = distance_to_object(o_Mouse)
	var MouseDirection = point_direction(x,y,o_Mouse.x,o_Mouse.y)
	
	//draw an arrow out of the object going the opposite way
	draw_arrow(x,y,x + lengthdir_x(MouseDistance * 1.5, MouseDirection + 180),y + lengthdir_y(MouseDistance * 1.5, MouseDirection + 180),5)	
}

draw_self()