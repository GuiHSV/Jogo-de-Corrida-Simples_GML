
if isMovel
{
	velh = velh_inicial;
	
	if(angulo < 360) angulo += 2*velh_inicial;
	else angulo = 0;
	image_angle = angulo;
	
	/**/ colisao_solo(1); //*/ if(colisao_solo(sign(1))) velv = vel_jump;
	//else gravidade()
	
	//movimentacao_vertical();
}
//definir o resto do comportamento do obstáculo quando ele for móvel


if x + sprite_width/2 < camera_get_view_x(view_camera[0])
{
	//show_debug_message("obstáculo destruido.");
	instance_destroy();
}

