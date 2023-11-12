draw_set_halign(fa_center)
for (var _i = 0; _i < array_length(menu); _i++){
	draw_set_color(current_index==_i?c_green:c_white)
	draw_text(room_width/2, 100+32*_i, menu[_i])
}
draw_set_halign(fa_left)