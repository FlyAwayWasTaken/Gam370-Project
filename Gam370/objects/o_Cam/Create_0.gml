cam = view_camera[0]
view_w_half = camera_get_view_width(cam) / 2
view_h_half = camera_get_view_height(cam) / 2
follow = o_Player
yTo = follow.y - 50
y += (yTo - y)
ScreenShakeTimer = 0