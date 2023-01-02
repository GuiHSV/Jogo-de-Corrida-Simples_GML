
#region TEMPORIZADOR
if global.GameStatus == "Jogando"
{
	if tempo_buffer == 0
	{
		tempo_seg++;
		tempo_buffer = room_speed;
		if(tempo_seg mod 4 == 0) multiplicador += .1; //balancear melhor futuramente a adição do multiplicador
	}
	else tempo_buffer--;
}
#endregion


#region GERENCIADOR DE VARIÁVEIS
global.velhGlobal = VELH_INICIAL * multiplicador; // + velocidade_auxiliar do player;

if(obstaculo_delay > 0) obstaculo_delay--;
//...

#endregion


#region PARALLAX
var parallax_solo = layer_get_id("Parallax_Solo");
layer_x(parallax_solo, x)

if global.GameStatus == "Jogando" //colocar em um "for"
{
	var parallax = layer_get_id("Parallax_Perto");
	var veloc = lerp(0, global.velhGlobal, .7);
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
	var parallax = layer_get_id("Parallax_Perto");
	layer_hspeed(parallax, 0);
	
	parallax = layer_get_id("Parallax_Longe");
	layer_hspeed(parallax, 0);
	
	parallax = layer_get_id("Parallax_Nuvens");
	layer_hspeed(parallax, 0);
}

/*
var parallax_nomes = ["Parallax_Perto", "Parallax_Longe", "Parallax_Nuvens"];

var prllx_perto = layer_get_id("Parallax_Perto");
var prllx_longe = layer_get_id("Parallax_Longe");
var prllx_nuvens = layer_get_id("Parallax_Nuvens");//*/

//resto apenas define a velocidade como uma porcentágem da "global.velhGlobal", talvez usando um "for"

#endregion


