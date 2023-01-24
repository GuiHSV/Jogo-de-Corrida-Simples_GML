
//Desenhar área da câmera antiga
//draw_rectangle_color(0,64, 448,224, c_red, c_red, c_red, c_red, true)

#region DESENHA TEXTO ATRÁS
if global.GameStatus == "Iniciando" or global.GameStatus == "Pronto"
{
	//Desenha título do jogo
	desenhar_texto(20, room_height-10, "@2023 Made by Aliscell", fa_left, .5, c_black, c_black, true);
	desenhar_texto(room_width-20, room_height-10, "v.0.6", fa_right, .5, c_black, c_black, true);
}

if global.GameStatus == "Pronto"
{
	desenhar_texto(room_width/2, room_height-32, "Precione SPACE para começar", fa_center, .5, c_ltgray, c_gray, false);
}
		
if global.GameStatus == "FimDeJogo"
{
	desenhar_texto(room_width/2, 32, "Game Over", fa_center, 1.5, c_gray, c_black, true);
	desenhar_texto(room_width/2, 48, pontuacao_texto, fa_center, .5, c_black, c_black, false);
	desenhar_texto(room_width/2, room_height-48, "Precione QUALQUER BOTÃO para recomeçar", fa_center, .5, c_black, c_dkgray, false);
}
#endregion


if surface_exists(srf_visual)
{
	surface_set_target(srf_visual);
	var player = obj_Player
	
	#region DESENHA BARRAS PRETAS NA TELAS
	draw_set_color(c_black);
	draw_rectangle(0,0, room_width,room_height, false);
	draw_set_color(c_white);
	
	gpu_set_blendmode(bm_subtract);
	if(global.GameStatus == "Pausado") draw_set_alpha(.6)
	if(!resetando) draw_rectangle(0,barraSup_y, room_width,barraInf_y,false);
	else draw_circle(player.x+6, player.y-18, raioCirculo, false);
	draw_set_alpha(1);
	gpu_set_blendmode(bm_normal);
	#endregion
	
	#region DESENHA TEXTO NA FRENTE
	if(global.GameStatus == "Pausado") desenhar_texto(room_width/2, meioTela_y, "Pause", fa_center, 1, c_white, c_ltgray, false);
	
	if global.GameStatus != "Iniciando"
	{
		if(global.GameStatus == "Jogando" or HudAtivada) var cor = c_white;
		else var cor = c_ltgray;
		desenhar_texto_simples(19, barraSup_y - 9, "TEMPO: " + tempo_texto, fa_left, cor, true);
		desenhar_texto_simples(20, barraSup_y - 20, "VEL (*): " + string(global.velhGlobal), fa_left, c_white, true); //não pegar a velocidade literal
		desenhar_texto_simples(20, barraSup_y - 31, "*FPS: " + string(room_speed), fa_left, c_white, true); //para testes
		desenhar_texto_simples(room_width / 2, barraInf_y + 9, "- " +  obj_Controlador.bioma + " -", fa_center, cor, true);
		desenhar_texto_simples(room_width - 20, barraSup_y - 9, "PONTUAÇÃO: " + pontuacao_texto, fa_right, cor, true);
		desenhar_texto_simples(room_width - 20, barraSup_y - 20, "(*) MELHOR P.: 00000000", fa_right, c_white, true); //Ainda não implementado sistema de armazenar pontuação
	}
	#endregion
	
	surface_reset_target();
	draw_surface(srf_visual, 0, 0);
}
else srf_visual = surface_create(room_width, room_height);

