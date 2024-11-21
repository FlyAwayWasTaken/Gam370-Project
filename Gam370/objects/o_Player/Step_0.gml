//check for touching the mouse and if left click is pressed and if we are standing still
if instance_place(x,y,o_Mouse) and mouse_check_button_pressed(mb_left) and VMomentum = 0 and HMomentum = 0
{
	with instance_create_layer(x,y,"Particles",o_ExpandParticle)
	{
		sprite_index = other.sprite_index	
		image_index = other.image_index
	}
	PullingBack = true
	if !audio_is_playing(mus_PullBack)
	{
		audio_play_sound(mus_PullBack,1,false)	
	}
}

if !mouse_check_button(mb_left)
{
	if PullingBack = true
	{
		//Launch player	
		audio_play_sound(mus_Jump,1,false)
		//Vertical Momentum
		VMomentum += (o_Mouse.y - y) / 10
		if VMomentum > 10
		{
			VMomentum = 10
		}
		//Horizontal Momentum
		HMomentum += (x - o_Mouse.x) / 10
		if HMomentum > 10
		{
			HMomentum = 10
		}
	}
	PullingBack = false	
}

//Gravity physics
VMomentum += Grav

//get movement direction
var VMoveDirection = sign(VMomentum)
var VMomentumAbs = abs(VMomentum)

var HMoveDirection = sign(HMomentum)
var HMomentumAbs = abs(HMomentum)

//get player sprite height and width
var PlayerHeight = sprite_get_height(sprite_index)
var PlayerWidth = sprite_get_width(sprite_index)

//Going Up
if VMoveDirection > 0
{
	for (var i = 0; i < VMomentumAbs; i++) 
	{
		if place_meeting(x,y - 1 ,o_Wall)
		{
			//we've hit a wall! kill momentum and end this loop
			audio_play_sound(mus_WallSlam,1,false)
			o_Cam.ScreenShakeTimer = 10
			VMomentum = 0
			i = VMomentumAbs
			with instance_create_layer(x,y,"Particles",o_ExpandParticle)
			{
				sprite_index = other.sprite_index	
				image_index = other.image_index
			}
		}
		else
		{
			//commit movement
			y -= 1
		}
	}
}

//Going Down
if VMoveDirection < 0
{
	for (var i = 0; i < VMomentumAbs; i++) 
	{
		if place_meeting(x,y + 1,o_Wall)
		{
			//we've hit a wall! kill momentum and end this loop
			VMomentum = 0
			i = VMomentumAbs
		}
		else
		{
			//commit movement
			y += 1
		}		
	}
}

//Horizontal physics

//Going Left 
if HMoveDirection < 0
{
	for (var i = 0; i < HMomentumAbs; i++) 
	{
		if place_meeting(x - 1,y,o_Wall)
		{
			//we've hit a wall! bounce back the other way!
			with instance_create_layer(x,y,"Particles",o_ExpandParticle)
			{
				sprite_index = other.sprite_index	
				image_index = other.image_index
			}
			audio_play_sound(mus_WallSlam,1,false)
			o_Cam.ScreenShakeTimer = 10
			HMomentum = HMomentum * 0.3
			HMomentum = HMomentum * -1
			i = HMomentumAbs
		}
		else
		{
			//commit movement
			x -= 1
		}		
	}
}

//Going Right
if HMoveDirection > 0
{
	for (var i = 0; i < HMomentumAbs; i++) 
	{
		if place_meeting(x + 1,y ,o_Wall)
		{
			//we've hit a wall! bounce back the other way!
			with instance_create_layer(x,y,"Particles",o_ExpandParticle)
			{
				sprite_index = other.sprite_index	
				image_index = other.image_index
			}
			audio_play_sound(mus_WallSlam,1,false)
			o_Cam.ScreenShakeTimer = 10
			HMomentum = HMomentum * 0.3
			HMomentum = HMomentum * -1
			i = HMomentumAbs
		}
		else
		{
			//commit movement
			x += 1
		}
	}
}

//if we are touching the ground, instantly hault all momentum!
if instance_place(x, y + 1,o_Wall)
{
	HMomentum = 0
}

if VMomentum != 0 or HMomentum != 0
{
	with instance_create_layer(x,y,"Particles",o_FadeParticle)
	{
		sprite_index = other.sprite_index	
		image_index = other.image_index
	}
}