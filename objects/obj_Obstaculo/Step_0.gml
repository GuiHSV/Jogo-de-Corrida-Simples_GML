
//if(global.GameStatus) moveH_geral();

if(sprite_index == spr_obst_M_deserto) velh = 1;

if x + sprite_width/2 < camera_get_view_x(view_camera[0])
{
	//show_debug_message("obstáculo destruido.");
	instance_destroy();
}

