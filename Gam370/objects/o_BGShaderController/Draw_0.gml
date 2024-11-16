x = 176
y = o_Cam.y

draw_sprite(s_BG1,0,x,y)

//create surface to we can take circles out of the black to show the background behind
surf = surface_create(352,4000)
//set draw target to newly created surface
surface_set_target(surf)
//fill this surface with the color black
draw_clear_alpha(c_black, 1)

gpu_set_blendmode(bm_subtract)

with o_Wall
{
	draw_self()
}
with o_RampLeft
{
	draw_self()
}
with o_RampRight
{
	draw_self()
}

//draw surface then delete it
gpu_set_blendmode(bm_normal)
surface_reset_target()
draw_surface(surf,0,0)
surface_free(surf)

//draw lines on top of surface
with o_Wall
{
	//check if there is a wall or ramp above me
	if !(instance_place(x,y - 16,o_Wall) or  instance_place(x,y - 16,o_RampLeft) or  instance_place(x,y - 16,o_RampRight))
	{
		draw_line(x - 1,y,x + 16,y)
	}
	//check if there is a wall or ramp below me
	if !(instance_place(x,y + 16,o_Wall) or  instance_place(x,y + 16,o_RampLeft) or  instance_place(x,y + 16,o_RampRight))
	{
		draw_line(x - 1,y + 16,x + 15,y + 16)
	}
	//check if there is a wall or ramp to the left of me
	if !(instance_place(x - 16,y,o_Wall) or  instance_place(x - 16,y,o_RampLeft) or  instance_place(x - 16,y,o_RampRight))
	{
		draw_line(x - 1,y,x - 1,y + 16)
	}
	//check if there is a wall or ramp to the right of me
	if !(instance_place(x + 16,y,o_Wall) or  instance_place(x + 16,y,o_RampLeft) or  instance_place(x + 16,y,o_RampRight))
	{
		draw_line(x + 16,y,x + 16,y + 16)
	}
	
}
with o_RampLeft
{
	draw_line(x,y,x + 16,y + 16)
}
with o_RampRight
{
	draw_line(x - 1,y + 16,x + 15,y)
}
