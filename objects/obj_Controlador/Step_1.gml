
#region TEMPORIZADOR
if global.GameStatus == "Jogando"
{
	if tempo_buffer == 0
	{
		tempo_seg++;
		tempo_buffer = room_speed;
		if(tempo_seg mod 5 == 0) multiplicador += .05; //balancear melhor futuramente
	}
	else tempo_buffer--;
}
#endregion

#region GERENCIADOR
global.velhGlobal = VELH_INICIAL * multiplicador; // + velocidade_auxiliar do player

//NOTA: movimentação pixel a pixel do parallax não sincronizada com a dos obstáculos. Tentar resolver apenas se for muito incômodo
var parallax_base = layer_get_id("Parallax_base");
if(global.GameStatus == "Jogando") layer_hspeed(parallax_base, -global.velhGlobal);
else layer_hspeed(parallax_base, 0);

if(obstaculo_delay > 0) obstaculo_delay--;
//...

#endregion


