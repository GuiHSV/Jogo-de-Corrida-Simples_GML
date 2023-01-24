
if(keyboard_check_pressed(vk_end)) game_restart();

#region TEMPORIZADOR (*)
if global.GameStatus == "Jogando" and multiplicador >= 1
{
	if contador_fps == 0
	{
		tempo_seg++;
		contador_fps = room_speed;
		if(tempo_seg mod floor(global.velhGlobal) == 0)	multiplicador += .05;
	}
	else contador_fps--;
	
	if(contador_fps mod floor(room_speed/10) == 0) pontuacao++;
}
#endregion


#region GERENCIADOR DE VARIÁVEIS
global.velhGlobal = VELH_INICIAL * multiplicador; // + velocidade auxiliar do player;
if(global.GameStatus == "Jogando") and (multiplicador < 1) multiplicador += .05;

if global.GameStatus == "Jogando" and multiplicador >= 1
{
	if(obstaculo_intervalo_t > 0) obstaculo_intervalo_t--;
	//if(terreno_timer > 0) terreno_timer--;
}

#endregion
