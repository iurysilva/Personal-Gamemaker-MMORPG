draw_set_color(c_white)
draw_set_halign(fa_center)
var _xpos = x-camera_get_view_x(view_camera[0])
var _ypos = y-camera_get_view_y(view_camera[0])
draw_text(_xpos*2, _ypos*2-48, name)
draw_set_halign(fa_left)
