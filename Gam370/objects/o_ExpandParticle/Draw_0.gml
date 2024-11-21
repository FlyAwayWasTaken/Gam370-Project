image_alpha -= FadeSpeed
image_xscale += FadeSpeed * 1.5
image_yscale += FadeSpeed * 1.5
if image_alpha < 0
{
	instance_destroy()	
}

draw_self()
