/// @description Insert description here
// You can write your code in this editor

if(global.jogoComecou) moveH_geral();


if(x + sprite_width/2 < camera_get_view_x(view_camera[0]))
{
	show_debug_message("obstáculo destruido.");
	instance_destroy();
}

//camera_get_view_x()

