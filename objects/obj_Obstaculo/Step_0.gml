
//if(global.GameStatus) moveH_geral();

if isMovel
{
	velh = velh_inicial;
	
	if(angulo < 360) angulo += 2*velh_inicial;
	else angulo = 0;
	image_angle = angulo;
	
	//if(colisao_solo()) velv = vel_jump;
	
	movimentacao_vertical();
}
//definir o resto do comportamento do obstáculo quando ele for móvel

if x + sprite_width/2 < camera_get_view_x(view_camera[0])
{
	//show_debug_message("obstáculo destruido.");
	instance_destroy();
}

