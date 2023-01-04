
#region TEMPORIZADOR
if global.GameStatus == "Jogando"
{
	if tempo_buffer == 0
	{
		tempo_seg++;
		tempo_buffer = room_speed;
		if(tempo_seg mod 4 == 0) multiplicador += .1; //balancear melhor a adição do multiplicador
	}
	else tempo_buffer--;
}
#endregion


#region GERENCIADOR DE VARIÁVEIS <=================== AQUI
global.velhGlobal = VELH_INICIAL * multiplicador; // + velocidade_auxiliar do player;

//	Geração de Obstáculos | atual: de acordo com o tempo de jogo | ideal: de acordo com a velocidade
if tempo_buffer == 1
{
	if(tempo_seg == 10) array_push(obstaculo_tipo, "obst_G")
	if(tempo_seg == 15) array_push(obstaculo_variacao, 2)
	
	if tempo_seg == 10
	{
		array_push(obstaculo_tipo, "");
		array_push(obstaculo_tipo, 0);
	}
	
	if tempo_seg == 20
	{
		array_push(obstaculo_tipo, "");
		array_push(obstaculo_tipo, 0);
	}
	
	if tempo_seg == 30
	{
		array_push(obstaculo_tipo, "");
		array_push(obstaculo_tipo, 0);
	}
	
	if tempo_seg == 40
	{
		array_push(obstaculo_tipo, "");
		array_push(obstaculo_tipo, 0);
	}
	
	if tempo_seg == 50
	{
		array_push(obstaculo_tipo, "");
		array_push(obstaculo_tipo, 0);
	}
}

if(obstaculo_delay > 0) obstaculo_delay--;
//...

#endregion


#region PARALLAX
var parallax_solo = layer_get_id("Parallax_Solo");
layer_x(parallax_solo, x);

if global.GameStatus == "Jogando"
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
	var parallax_nome = ["Parallax_Perto", "Parallax_Longe", "Parallax_Nuvens"];
	for(var i = 0; i < 2; i++)
	{
		var parallax = layer_get_id(parallax_nome[i]);
		layer_hspeed(parallax, 0);
	}
}

/*
var parallax_nomes = ["Parallax_Perto", "Parallax_Longe", "Parallax_Nuvens"];

var prllx_perto = layer_get_id("Parallax_Perto");
var prllx_longe = layer_get_id("Parallax_Longe");
var prllx_nuvens = layer_get_id("Parallax_Nuvens");//*/

//resto apenas define a velocidade como uma porcentágem da "global.velhGlobal", talvez usando um "for"
#endregion


