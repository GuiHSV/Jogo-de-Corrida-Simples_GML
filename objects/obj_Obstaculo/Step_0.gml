
#region COMPORTAMENTO
if isMovel and global.GameStatus == "Jogando"
{
	velh = velh_inicial;
	chao = colisao_solo(1);
	
	if(angulo < 360) angulo += 2*velh_inicial;
	else angulo = 0;
	image_angle = angulo;
	
	if(chao)
	{
		velv = -vel_jump;
		//show_message("Teste velv: " + string(velv))
	}
	gravidade();
	
	movimentacao_vertical();
}
#endregion


	//	Autodestruição
if(x+sprite_width/2 < camera_get_view_x(view_camera[0])) instance_destroy();
