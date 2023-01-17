
if(keyboard_check_pressed(vk_end)) game_restart();

#region TEMPORIZADOR (*)
if global.GameStatus == "Jogando" and multiplicador >= 1
{
	if contador_fps == 0
	{
		tempo_seg++;
		contador_fps = room_speed;
		if(tempo_seg mod 2 + floor(global.velhGlobal-2) == 0) multiplicador += .05; //balancear melhor a adição do multiplicador
		if(contador_fps mod abs(room_speed/10) == 0) pontuacao++;
	}
	else contador_fps--;
	
	if(contador_fps mod abs(room_speed/10) == 0) pontuacao++;
}
#endregion


#region GERENCIADOR DE VARIÁVEIS
global.velhGlobal = VELH_INICIAL * multiplicador; // + velocidade_auxiliar do player;
if(global.GameStatus == "Jogando") and (multiplicador < 1) multiplicador += .05;

if global.GameStatus == "Jogando" and multiplicador >= 1
{
	if(obstaculo_intervalo_t > 0) obstaculo_intervalo_t--;
	//tempo_piscar_hud = 0;
}
else
{
	//if(tempo_piscar_hud > 0) tempo_piscar_hud -= 2;
	//else tempo_piscar_hud = room_speed;
}
//...

#endregion

