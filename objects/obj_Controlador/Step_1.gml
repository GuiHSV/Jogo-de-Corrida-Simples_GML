
#region TEMPORIZADOR (*)
if global.GameStatus == "Jogando"
{
	if tempo_fps == 0
	{
		tempo_seg++;
		tempo_fps = room_speed;
		if(tempo_seg mod 3 == 0) multiplicador += .05; //balancear melhor a adição do multiplicador
	}
	else tempo_fps--;
}
#endregion


#region GERENCIADOR DE VARIÁVEIS
global.velhGlobal = VELH_INICIAL * multiplicador; // + velocidade_auxiliar do player;

if(global.GameStatus == "Jogando") and (obstaculo_intervalo_t > 0) obstaculo_intervalo_t--;
//...

#endregion


#region PARALLAX
if(abs(x) >= room_width) x += room_width;
var parallax_solo = layer_get_id("Parallax_Solo");
layer_x(parallax_solo, x);

if global.GameStatus == "Jogando"
{
	var parallax = layer_get_id("Parallax_Perto");
	var veloc = lerp(0, global.velhGlobal, .6);
	layer_hspeed(parallax, -veloc);
	
	parallax = layer_get_id("Parallax_Longe");
	veloc = lerp(0, global.velhGlobal, .3);
	layer_hspeed(parallax, -veloc);
	
	parallax = layer_get_id("Parallax_Nuvens");
	veloc = lerp(0, global.velhGlobal, .1);
	layer_hspeed(parallax, -veloc);
}
else
{
	var parallax_nome = ["Parallax_Perto", "Parallax_Longe", "Parallax_Nuvens"];
	for(var i = 0; i < 2; i++)
	{
		var parallax = layer_get_id(parallax_nome[i]);
		layer_hspeed(parallax, 0);
	}
}
#endregion


