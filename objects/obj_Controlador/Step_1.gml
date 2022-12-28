
#region TEMPORIZADOR
if global.GameStatus == "Jogando"
{
	if tempo_buffer == 0
	{
		tempo_seg++;
		tempo_buffer = room_speed;
		if(tempo_seg mod 5 == 0) multiplicador += .1; //balancear melhor futuramente
	}
	else tempo_buffer--;
}
#endregion

#region GERENCIADOR
global.velhGlobal = VELH_INICIAL * multiplicador; // + velocidade_auxiliar do player

if(obstaculo_delay > 0) obstaculo_delay--;
//...

#endregion


