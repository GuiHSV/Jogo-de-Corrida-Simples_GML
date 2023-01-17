
//Desenhar área da câmera antiga
//draw_rectangle_color(0,64, 448,224, c_red, c_red, c_red, c_red, true)

#region DESENHA TEXTO ATRÁS
if global.GameStatus == "Iniciando" or global.GameStatus == "Pronto"
{
	desenhar_texto(room_width/2, room_height-10, "2023 Aliscell", fa_center, .5, c_black, c_black, true);
	desenhar_texto(room_width-20, room_height-10, "v.0.6", fa_right, .5, c_black, c_black, true);
}

if global.GameStatus == "Pronto"
{
	desenhar_texto(room_width/2, room_height-48, "Precione SPACE para começar", fa_center, .5, c_ltgray, c_gray, false);
}
		
if global.GameStatus == "FimDeJogo"
{
	desenhar_texto(room_width/2, 32, "Game Over", fa_center, 1.5, c_gray, c_black, true);
	desenhar_texto(room_width/2, 48, pontuacao_texto, fa_center, .5, c_black, c_black, false);
}
#endregion

if surface_exists(srf_visual)
{
	surface_set_target(srf_visual);
	
	#region DESENHA BARRAS PRETAS NA TELAS
	draw_set_color(c_black);
	draw_rectangle(0,0, room_width,room_height, false);
	draw_set_color(c_white);
	
	gpu_set_blendmode(bm_subtract);
	if(global.GameStatus == "Pausado") draw_set_alpha(.6)
	draw_rectangle(0,barraSup_y, room_width,barraInf_y,false);
	draw_set_alpha(1);
	gpu_set_blendmode(bm_normal);
	
	//troca o retangulo branco por um circulo que fecha antes de resetar a sala
	#endregion
	
	#region DESENHA TEXTO NA FRENTE
	if(global.GameStatus == "Pausado") desenhar_texto(room_width/2, meioTela_y, "Pause", fa_center, 1, c_white, c_ltgray, false);
	
	if global.GameStatus != "Iniciando"
	{
		desenhar_texto(20, barraSup_y - 9, "VEL: " + string(global.velhGlobal), fa_left, .5, c_white, c_white, true);
		desenhar_texto(room_width/2, barraInf_y + 9, "- " +  obj_Controlador.bioma + " -", fa_center, .5, c_white, c_white, true);
		desenhar_texto(room_width - 20, barraSup_y - 20, "*MELHOR P.: 00000000", fa_right, .5, c_white, c_white, true);
		if(global.GameStatus == "Jogando" or HudAtivada) desenhar_texto(room_width - 20, barraSup_y - 9, "PONTUAÇÃO: " + pontuacao_texto, fa_right, .5, c_white, c_white, true);
	}
	#endregion
	
	surface_reset_target();
	draw_surface(srf_visual, 0, 0);
}
else srf_visual = surface_create(room_width, room_height);

