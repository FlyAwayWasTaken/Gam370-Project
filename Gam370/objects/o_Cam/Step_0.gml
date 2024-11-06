if (instance_exists(follow))
{
	yTo = follow.y - 50
}

y += (yTo - y) / 10
y = round(y)
x = 174

if ScreenShakeTimer > 0
{
	y += (yTo - y)
	x = round(x)
	y = round(y)
	x += irandom_range(-7,7)
	y += irandom_range(-7,7)
	ScreenShakeTimer -= 1
}

camera_set_view_pos(cam,x-view_w_half,y-view_h_half)